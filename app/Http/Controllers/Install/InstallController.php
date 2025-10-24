<?php

namespace App\Http\Controllers\Install;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Exception;
use Illuminate\Support\Facades\Schema;

class InstallController extends Controller
{
    public function step0(Request $request)
    {
        $url = $request->url();
        if (strpos($request->url(), '/public') === false) {
            return redirect($url . '/public');
        }

        Artisan::call('config:clear');
        try {
            DB::connection()->getPdo();

            if (strpos($url, '/public') !== false) {
                return redirect()->route('admin.login');
            } else {
                return redirect($url . '/public');
            }
        } catch (Exception $e) {
            return view('installation.step0')->with('errors', $e->getMessage());
        }
    }
    public function step1(Request $request)
    {
        if (Hash::check('step_1', $request['token'])) {

            $permission['curl_enabled'] = function_exists('curl_version');
            $permission['env_file'] = is_writable(base_path('.env'));
            $permission['framework_file'] = is_writable(base_path('storage/framework'));
            $permission['logs_file'] = is_writable(base_path('storage/logs'));

            return view('installation.step1', compact('permission'));
        }
        session()->flash('error', 'Access denied!');
        return redirect()->route('step0');
    }
    public function step2(Request $request)
    {
        if (Hash::check('step_2', $request['token'])) {
            return view('installation.step2');
        }
        session()->flash('error', 'Access denied!');
        return redirect()->route('step0');
    }
    public function step3(Request $request)
    {
        if (Hash::check('step_3', $request['token'])) {
            return view('installation.step3');
        }
        session()->flash('error', 'Access denied!');
        return redirect()->route('step0');
    }
    public function step4(Request $request)
    {
        if (Hash::check('step_4', $request['token'])) {
            return view('installation.step4');
        }
        session()->flash('error', 'Access denied!');
        return redirect()->route('step0');
    }

    public function database_installation(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'host_name' => 'required',
            'database_name' => 'required',
            'username' => 'required',
        ]);
        if ($validator->fails()) {
            $errs = $validator->errors()->first();
            session()->flash('error', $errs);
            return redirect()->route('step2', ['token' => bcrypt('step_2')]);
        }

        if ($this->check_database_connection($request['host_name'], $request['database_name'], $request['username'], $request['password'])) {

            Artisan::call('config:clear');

            $path = base_path('.env');
            if (file_exists($path)) {

                $file_contents = file_get_contents($path);

                $old_APP_URL = env('APP_URL');
                $old_DB_HOST = env('DB_HOST');
                $old_DB_DATABASE = env('DB_DATABASE');
                $old_DB_USERNAME = env('DB_USERNAME');
                $old_DB_PASSWORD = env('DB_PASSWORD');

                $url = explode('/', url('/'));
                array_pop($url);
                $new_url = implode('/', $url);

                $key = [
                    'APP_URL=' . $old_APP_URL,
                    'DB_HOST=' . $old_DB_HOST,
                    'DB_DATABASE=' . $old_DB_DATABASE,
                    'DB_USERNAME=' . $old_DB_USERNAME,
                    'DB_PASSWORD=' . $old_DB_PASSWORD
                ];
                $value = [
                    'APP_URL=' . $new_url,
                    'DB_HOST=' . $request['host_name'],
                    'DB_DATABASE=' . $request['database_name'],
                    'DB_USERNAME=' . $request['username'],
                    'DB_PASSWORD=' . $request['password']
                ];
                file_put_contents($path, str_replace($key,  $value, $file_contents));

                Artisan::call('config:clear');
                return redirect()->route('step3', ['token' => $request['token']]);
            } else {
                session()->flash('error', 'Database error!');
                return redirect()->route('step3', ['token' => bcrypt('step_3')]);
            }
        } else {
            session()->flash('error', 'Database host error!');
            return redirect()->route('step2', ['token' => bcrypt('step_2')]);
        }
    }
    function check_database_connection($db_host = "", $db_name = "", $db_user = "", $db_pass = "")
    {
        try {
            if (@mysqli_connect($db_host, $db_user, $db_pass, $db_name)) {
                return true;
            } else {
                return false;
            }
        } catch (Exception $e) {
            return false;
        }
    }

    public function system_settings(Request $request)
    {
        if (!Hash::check('step_4', $request['token'])) {
            session()->flash('error', 'Access denied!');
            return redirect()->route('step0');
        }

        $validator = Validator::make($request->all(), [
            'user_name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
        ]);
        if ($validator->fails()) {
            $errs = $validator->errors()->first();
            session()->flash('error', $errs);
            return redirect()->route('step4', ['token' => bcrypt('step_4')]);
        }

        Admin::query()->truncate();

        Admin::create([
            'user_name' => $request['user_name'],
            'email' => $request['email'],
            'password' => Hash::make($request['password']),
            'type' => 1,
            'status' => 1,
        ]);

        return view('installation.step5');
    }
    public function import_sql()
    {
        try {
            $sql_path = base_path('db/dt_pocketfm.sql');

            if (file_exists($sql_path)) {
                DB::unprepared(file_get_contents($sql_path));
                return redirect()->route('step4', ['token' => bcrypt('step_4')]);
            } else {
                session()->flash('error', 'Database sql file not found.');
                return redirect()->route('step0');
            }
        } catch (Exception $exception) {
            session()->flash('error', 'Your database is not clean, do you want to clean database then import?');
            return back();
        }
    }
    public function force_import_sql()
    {
        try {
            foreach (DB::select('SHOW TABLES') as $table) {
                $table_array = get_object_vars($table);
                Schema::drop($table_array[key($table_array)]);
            }
            $sql_path = base_path('db/dt_pocketfm.sql');
            DB::unprepared(file_get_contents($sql_path));
            return redirect()->route('step4', ['token' => bcrypt('step_4')]);
        } catch (Exception $exception) {
            session()->flash('error', 'Check your database permission!');
            return back();
        }
    }
}
