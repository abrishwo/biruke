@extends('installation.layout.page-app')

@section('content')
    <div class="main-content">
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <div class="text-center mb-3">
                        <h1 class="h3">Admin Account Settings <i class="fa fa-cogs"></i></h1>
                        <p>Provide your information.</p><br>
                    </div>
                    <div class="text-muted">
                        <form method="POST" action="{{ route('system_settings',['token'=>bcrypt('step_4')]) }}">
                            @csrf
                            <div class="form-row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>User Name<span class="text-danger">*</span></label>
                                        <input type="text" name="user_name" class="form-control" placeholder="User Name here..." autofocus>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Admin Login Email<span class="text-danger">*</span></label>
                                        <input type="text" name="email" class="form-control" placeholder="Email here...">
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label>Password<span class="text-danger">*</span></label>
                                        <input type="password" name="password" class="form-control" placeholder="Password here...">
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