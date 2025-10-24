@extends('installation.layout.page-app')

@section('content')
    <div class="main-content">
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <div class="mar-ver pad-btm text-center">
                        <h1 class="h3">Installation Progress Started!</h1>
                        <p>We are checking file permissions and version.</p>
                    </div>

                    <ul class="list-group mt-3">
                        <li class="list-group-item text-semibold">
                            @php
                                $phpVersion = number_format((float)phpversion(), 2, '.', '');
                            @endphp
                            @if ($phpVersion >= 8.0)
                                <i class="fa-solid fa-circle-check fa-xl text-success mr-2"></i>
                            @else
                                <i class="fa-solid fa-circle-xmark fa-xl text-danger mr-2"></i>
                            @endif
                            Php version 8.0 +
                        </li>
                        <li class="list-group-item text-semibold">
                            @if ($permission['curl_enabled'])
                                <i class="fa-solid fa-circle-check fa-xl text-success mr-2"></i>
                            @else
                                <i class="fa-solid fa-circle-xmark fa-xl text-danger mr-2"></i>
                            @endif
                            Curl Enabled
                        </li>
                        <li class="list-group-item text-semibold">
                            @if ($permission['env_file'])
                                <i class="fa-solid fa-circle-check fa-xl text-success mr-2"></i>
                            @else
                                <i class="fa-solid fa-circle-xmark fa-xl text-danger mr-2"></i>
                            @endif
                                <b>.env</b> File Permission
                        </li>
                        <li class="list-group-item text-semibold">
                            @if ($permission['framework_file'])
                                <i class="fa-solid fa-circle-check fa-xl text-success mr-2"></i>
                            @else
                                <i class="fa-solid fa-circle-xmark fa-xl text-danger mr-2"></i>
                            @endif
                            <b>storage/framework</b> File Permission
                        </li>
                        <li class="list-group-item text-semibold">
                            @if ($permission['logs_file'])
                                <i class="fa-solid fa-circle-check fa-xl text-success mr-2"></i>
                            @else
                                <i class="fa-solid fa-circle-xmark fa-xl text-danger mr-2"></i>
                            @endif
                            <b>storage/log</b> File Permission
                        </li>
                    </ul>

                    <p class="text-center pt-3">
                        @if ( $phpVersion >= 8.0 && $permission['curl_enabled'] == 1 && $permission['env_file'] == 1 && $permission['framework_file'] == 1 && $permission['logs_file'] == 1)
                            <a href="{{ route('step2',['token'=>bcrypt('step_2')]) }}" class="btn btn-default mw-120">NEXT<i class="fa-solid fa-angles-right ml-2"></i></a>
                        @endif
                    </p>
                </div>
            </div>
        </div>
    </div>
@endsection