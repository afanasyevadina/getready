<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Admin area</title>

    <!-- Scripts -->

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">

    <!-- Styles -->
    <link href="{{ asset('public/css/template.css') }}" rel="stylesheet">
    <link href="{{ asset('public/css/admin.css') }}" rel="stylesheet">
</head>

<body>
    <div class="row">
        <nav class="small-4 col">
            <ul>
                <li><a href="{{ route('nav') }}">Main Nav</a></li>
                <li><a href="{{ route('symbols') }}">Design Symbols</a></li>
                <li><a href="{{ route('orders') }}">Pre-Orders</a></li>
                <li><a href="{{ route('logout') }}" onclick="event.preventDefault();
                    document.getElementById('logout-form').submit();">Logout</a></li>
            </ul>
            <form id="logout-form" action="{{ route('logout') }}" method="POST">@csrf</form>
        </nav>
    </div>


    <div class="row">
        @yield('content')
    </div>
</body>

</html>