@extends('installation.layout.page-app')

@section('content')
    <div class="main-content">
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <div class="mar-ver pad-btm text-center">
                        <h1 class="h3">DivineTech Software Installation</h1>
                        <p>Provide required information.</p>
                    </div>

                    <ol class="list-group mt-3">
                        <li class="list-group-item text-semibold">
                            <i class="fa-solid fa-check fa-lg"></i>
                            <span>Database Name</span>
                        </li>
                        <li class="list-group-item text-semibold">
                            <i class="fa-solid fa-check fa-lg"></i>
                            <span>Database UserName</span>
                        </li>
                        <li class="list-group-item text-semibold">
                            <i class="fa-solid fa-check fa-lg"></i>
                            <span>Database Password</span>
                        </li>
                        <li class="list-group-item text-semibold">
                            <i class="fa-solid fa-check fa-lg"></i>
                            <span>Database Host</span>
                        </li>
                    </ol>
                    <br>

                    <div class="text-center">
                        <a href="{{ route('step1',['token'=>bcrypt('step_1')]) }}" class="btn btn-default mw-120">INSTALLATION START<i class="fa-solid fa-angles-right ml-2"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
   