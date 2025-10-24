<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Meta Tag -->
    <meta charset="utf-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <link href="{{asset('assets/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{asset('assets/css/dataTables.bootstrap4.min.css') }}" rel="stylesheet">
    <link href="{{asset('assets/css/toastr.min.css')}}" rel="stylesheet" type="text/css">
    <link href="{{asset('assets/css/style.css') }}" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css">

    <style>
        .list-group-item {
            padding-top: 18px !important;
            padding-bottom: 18px !important;
            background-color: transparent;
        }
        .dropdown-menu, .card {
            background-color: #ffffffe3;
            border: none;
        }
        .form-control {
            background-color: #ffffff;
            color: var(--title-color);
        }
        .main-content {
            display: flex;
            justify-content: center;
            width: 100%;
            height: 100vh;
            padding-top: 70px;
            background-image: url("../public/assets/imgs/install_bg.png");
            background-size: cover;
        }
    </style>
</head>

<body>

    @yield('content')

    <div style="display:none" id="dvloader"><img src="{{ asset('assets/imgs/loading.gif')}}" /></div>

    <!-- Feather Icon -->
    <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
    <!-- Jquery -->
    <script src="{{ asset('assets/js/jquery.min.js') }}"></script>
    <script src="{{ asset('assets/js/popper.min.js') }}"></script>
    <script src="{{ asset('assets/bootstrap/js/bootstrap.min.js') }}"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Toastr -->
    <script src="{{ asset('assets/js/toastr.min.js')}}"></script>

    <script>
        // Toastr MSG Show
        @if(Session::has('error'))
        toastr.error('{{ Session::get("error") }}');
        @elseif(Session::has('success'))
        toastr.success('{{ Session::get("success") }}');
        @endif

        function showLoder() {
            $("#dvloader").show();
        }
    </script>
</body>

</html>