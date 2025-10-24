<div class="sidebar">
    <div class="side-head">
        <a href="{{route('artist.dashboard')}}" class="primary-color side-logo">
            <h3>{{App_Name()}}</h3>
        </a>
        <button class="btn side-toggle">
            <span></span>
            <span></span>
            <span></span>
        </button>
    </div>

    <ul class="side-menu mt-4">
        <li class="side_line {{ request()->routeIs('artist.dashboard') ? 'active' : '' }}{{ request()->routeIs('profile*') ? 'active' : '' }}">
            <a href="{{ route('artist.dashboard')}}">
                <i class="fa-solid fa-house fa-2xl menu-icon"></i>
                <span>{{__('Label.Dashboard')}}</span>
            </a>
        </li>
        <li class="dropdown {{ request()->routeIs('aprofile*') ? 'active' : '' }}{{ request()->routeIs('achangepassword*') ? 'active' : '' }}">
            <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa-solid fa-user fa-2xl menu-icon"></i>
                <span>Profile</span>
            </a>
            <ul class="dropdown-menu side-submenu {{ request()->routeIs('aprofile*') ? 'show' : '' }}{{ request()->routeIs('achangepassword*') ? 'show' : '' }}">
                <li class="side_line {{ request()->routeIs('aprofile*') ? 'active' : '' }}">
                    <a href="{{ route('aprofile.index')}}" class="dropdown-item">
                        <i class="fa-solid fa-user fa-2xl submenu-icon"></i>
                        <span>Profile</span>
                    </a>
                </li>
                <li class="side_line {{ request()->routeIs('achangepassword*') ? 'active' : '' }}">
                    <a href="{{ route('achangepassword.index')}}" class="dropdown-item">
                        <i class="fa-solid fa-lock fa-2xl submenu-icon"></i>
                        <span>Change Password</span>
                    </a>
                </li>
            </ul>
        </li>
        <li class="side_line {{ request()->routeIs('aaudiobook*') ? 'active' : '' }}">
            <a href="{{ route('aaudiobook.index') }}">
                <i class="fa-solid fa-microphone fa-2xl menu-icon"></i>
                <span>Audio Book</span>
            </a>
        </li>
        <li class="side_line {{ request()->routeIs('anovel*') ? 'active' : '' }}">
            <a href="{{ route('anovel.index') }}">
                <i class="fa-solid fa-book fa-2xl menu-icon"></i>
                <span>Novel</span>
            </a>
        </li>
        <li class="side_line {{ request()->routeIs('athreads*') ? 'active' : '' }}">
            <a href="{{ route('athreads.index') }}">
                <i class="fa-brands fa-threads fa-2xl menu-icon"></i>
                <span>Threads</span>
            </a>
        </li>
        <li class="side_line {{ request()->routeIs('amusic*') ? 'active' : '' }}">
            <a href="{{ route('amusic.index') }}">
                <i class="fa-solid fa-music fa-2xl menu-icon"></i>
                <span>Music</span>
            </a>
        </li>
        <li class="side_line {{ request()->routeIs('areviews*') ? 'active' : '' }}">
            <a href="{{ route('areviews.index') }}">
                <i class="fa-solid fa-comments fa-2xl menu-icon"></i>
                <span>Reviews</span>
            </a>
        </li>
        <li>
            <a href="{{ route('artist.logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                <i class="fa-solid fa-arrow-right-from-bracket fa-2xl menu-icon"></i>
                <span>{{__('Label.Logout')}}</span>
            </a>

            <form id="logout-form" action="{{ route('artist.logout') }}" method="GET" class="d-none">
                @csrf
            </form>
        </li>
    </ul>
</div>