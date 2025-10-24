@extends('installation.layout.page-app')

@section('content')
    <div class="main-content">
        <div class="container">
            <div class="card">
                <div class="card-body">
                <div class="text-center">
                    <h1 class="h3">Import Software Database</h1>
                </div>
                <p class="text-muted text-center">
                    <strong>Database is connected</strong>. Proceed
                    <strong>Press Install</strong>.
                    This automated process will configure your database.
                </p>
                @if(session()->has('error'))
                    <div class="text-center">
                        <a href="{{ route('force-import-sql') }}" class="btn btn-default mw-120" onclick="showLoder()">Force Import Database</a>
                    </div>
                @else
                    <div class="text-center">
                        <a href="{{ route('import_sql') }}" class="btn btn-default mw-120" onclick="showLoder()">Import Database</a>
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection