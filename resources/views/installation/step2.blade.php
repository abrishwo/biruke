@extends('installation.layout.page-app')

@section('content')
    <div class="main-content">
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <div class="mar-ver pad-btm text-center">
                        <h1 class="h3">Configure Database</h1>
                        <p>Provide database information correctly.</p>
                    </div>

                    <div class="text-muted mt-3">
                        <form method="POST" action="{{ route('install.db',['token'=>bcrypt('step_3')]) }}">
                            @csrf
                            <div class="form-row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Database Host<span class="text-danger">*</span></label>
                                        <input type="text" name="host_name" class="form-control" placeholder="Host Name here..." autofocus>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Database Name<span class="text-danger">*</span></label>
                                        <input type="text" name="database_name" class="form-control" placeholder="Database Name here...">
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Database Username<span class="text-danger">*</span></label>
                                        <input type="text" name="username" class="form-control" placeholder="Database Username here...">
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Database Password<span class="text-danger">*</span></label>
                                        <input type="password" name="password" class="form-control" placeholder="Database Password here...">
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-default mw-120">Continue</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection