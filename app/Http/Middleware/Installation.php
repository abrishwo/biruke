<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Exception;
use Illuminate\Support\Facades\Artisan;

class Installation
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        try {

            Artisan::call('config:clear');
            if (@mysqli_connect(env('DB_HOST'), env('DB_USERNAME'), env('DB_PASSWORD'), env('DB_DATABASE'))) {
                $response = $next($request);
                return $response;
            } else {
                return redirect()->route('step0');
            }
        } catch (Exception $e) {
            return redirect()->route('step0');
        }

        $response = $next($request);
        return $response;
    }
}
