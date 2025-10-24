<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Page;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use URL;
use Validator;

class AdminController extends Controller
{

    protected $redirectTo = 'admin/login';

    public function __construct()
    {
        $this->middleware('guest', ['except' => 'logout']);
    }

    public function getLogin()
    {
        try {
            return view('auth.login');
        } catch (Exception $e) {
            return response()->json(array('status' => 400, 'errors' => $e->getMessage()));
        }
    }

    public function postLogin(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'email' => 'required|email',
                'password' => 'required|min:4',
            ]);
            if ($validator->fails()) {
                $errs = $validator->errors()->all();
                return response()->json(array('status' => 400, 'errors' => $errs));
            }

            $requestData = $request->all();
            if ($token = Auth()->guard('admin')->attempt(['email' => $requestData['email'], 'password' => $requestData['password']])) {
                $user = auth()->guard('admin')->user();

                if ($user->type == 1) {
                    $this->middleware('checkadmin');
                }
                return response()->json(array('status' => 200, 'success' => __('Label.success_login')));
            } else {
                return response()->json(array('status' => 400, 'errors' => __('Label.error_login')));
            }
        } catch (Exception $e) {
            return response()->json(array('status' => 400, 'errors' => $e->getMessage()));
        }
    }

    public function logout()
    {
        try {
            Auth()->guard('admin')->logout();
            return redirect(route('admin.index'))->with('success', __('Label.logout_successfully'));
        } catch (Exception $e) {
            return response()->json(array('status' => 400, 'errors' => $e->getMessage()));
        }
    }

    public function Page()
    {
        try {
            $currentURL = URL::current();

            if (str_contains($currentURL, 'about-us')) {
                $data = Page::select('*')->where('page_name', 'about-us')->first();
                return view('page', ['result' => $data]);
            } elseif (str_contains($currentURL, 'privacy-policy')) {
                $data = Page::select('*')->where('page_name', 'privacy-policy')->first();
                return view('page', ['result' => $data]);
            } elseif (str_contains($currentURL, 'terms-and-conditions')) {
                $data = Page::select('*')->where('page_name', 'terms-and-conditions')->first();
                return view('page', ['result' => $data]);
            } elseif (str_contains($currentURL, 'refund-policy')) {
                $data = Page::select('*')->where('page_name', 'refund-policy')->first();
                return view('page', ['result' => $data]);
            } else {
                abort(404);
            }
        } catch (Exception $e) {
            return response()->json(array('status' => 400, 'errors' => $e->getMessage()));
        }
    }

}
