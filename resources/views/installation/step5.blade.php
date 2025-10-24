@extends('installation.layout.page-app')

@section('content')
    <div class="main-content">
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <div class="pad-btm text-center">
                        <h1 class="h3">All Done, Great Job.</h1>
                        <p>Your software is ready to run.</p>
                    </div>
                    <div class="text-center">
                        <a href="{{ route('admin.login') }}" class="btn btn-default mw-120">Admin Panel</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection