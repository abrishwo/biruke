<?php

use App\Models\Admin;
use App\Models\General_Setting;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Storage;

function settingData()
{
    $setting = General_Setting::get();
    $data = [];
    foreach ($setting as $value) {
        $data[$value->key] = $value->value;
    }
    return $data;
}
function App_Name()
{
    $data = settingData();
    $app_name = $data['app_name'];

    if (isset($app_name) && $app_name != "") {
        return $app_name;
    } else {
        return env('APP_NAME');
    }
}
function adminData()
{
    return Admin::latest()->first();
}
function string_cut($string, $len)
{
    if (strlen($string) > $len) {
        $string = mb_substr(strip_tags($string), 0, $len, 'utf-8') . '...';
        // $string = substr(strip_tags($string),0,$len).'...';
    }
    return $string;
}
function tab_icon()
{
    $settingData = settingData();
    $name = $settingData['app_logo'];
    $folder = "app";

    if ($name != "" && $folder != "") {

        $appName = Config::get('app.image_url');

        if (Storage::disk('public')->exists($folder . '/' . $name)) {
            $data = $appName . $folder . '/' . $name;
        } else {
            $data = asset('assets/imgs/no_img.png');
        }
    } else {
        $data = asset('/assets/imgs/no_img.png');
    }
    return ($data);
}
function Check_Admin_Access()
{
    if (Auth::guard('admin')->user()->type != 1) {
        return 0;
    } else {
        return 1;
    }
}
function TimeToMilliseconds($str)
{

    $time = explode(":", $str);

    $hour = (int) $time[0] * 60 * 60 * 1000;
    $minute = (int) $time[1] * 60 * 1000;
    $sec = (int) $time[2] * 1000;
    $result = $hour + $minute + $sec;
    return $result;
}
function no_format($num)
{
    if ($num > 1000) {
        $x = round($num);
        $x_number_format = number_format($x);
        $x_array = explode(',', $x_number_format);
        $x_parts = array('K', 'M', 'B', 'T');
        $x_count_parts = count($x_array) - 1;
        $x_display = $x;
        $x_display = $x_array[0] . ((int) $x_array[1][0] !== 0 ? '.' . $x_array[1][0] : '');
        $x_display .= $x_parts[$x_count_parts - 1];

        return $x_display;
    }
    return $num;
}
function currency_code()
{
    $setting = settingData();
    return $setting['currency_code'];
}
function Artist_Data()
{
    if (Auth::guard('artist')->user()) {
        return Auth::guard('artist')->user();
    } else {
        return redirect()->route('artist.logout');
    }
}
// function smtpData()
// {
//     $setting = \App\Models\Smtp::first();

//     if (isset($setting) && $setting != null) {
//         return $setting;
//     }
//     return false;
// }
// function MillisecondsToTime($str)
// {
//     $Seconds = (int) $str / 1000;
//     $Seconds = round($Seconds);

//     $Format = sprintf('%02d:%02d:%02d', ((int) $Seconds / 3600), ((int) $Seconds / 60 % 60), ((int) $Seconds) % 60);
//     return $Format;
// }
// function sendNotification($array)
// {
//     $noty = \App\Models\General_Setting::where('key', 'onesignal_apid')->orWhere('key', 'onesignal_rest_key')->get();
//     $notification = [];
//     foreach ($noty as $row) {
//         $notification[$row->key] = $row->value;
//     }

//     $ONESIGNAL_APP_ID = $notification['onesignal_apid'];
//     $ONESIGNAL_REST_KEY = $notification['onesignal_rest_key'];

//     $content = array(
//         "en" => $array['description'],
//     );

//     $fields = array(
//         'app_id' => $ONESIGNAL_APP_ID,
//         'included_segments' => array('All'),
//         'data' => $array,
//         'headings' => array("en" => $array['name']),
//         'contents' => $content,
//         'big_picture' => $array['image'],
//     );

//     $fields = json_encode($fields);

//     $ch = curl_init();
//     curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
//     curl_setopt($ch, CURLOPT_HTTPHEADER, array(
//         'Content-Type: application/json; charset=utf-8',
//         'Authorization: Basic ' . $ONESIGNAL_REST_KEY,
//     ));
//     curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
//     curl_setopt($ch, CURLOPT_HEADER, false);
//     curl_setopt($ch, CURLOPT_POST, true);
//     curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
//     curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

//     $response = curl_exec($ch);
//     // dd($response);
//     curl_close($ch);
// }
