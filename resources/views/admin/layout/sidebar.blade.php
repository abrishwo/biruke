<div class="sidebar">
    <div class="side-head">
        <a href="{{route('admin.dashboard')}}" class="primary-color side-logo">
            <h3>{{App_Name()}}</h3>
        </a>
        <button class="btn side-toggle">
            <span></span>
            <span></span>
            <span></span>
        </button>
    </div>

    <ul class="side-menu mt-4">
        <li class="side_line {{ request()->routeIs('admin.dashboard') ? 'active' : '' }}{{ request()->routeIs('profile*') ? 'active' : '' }}">
            <a href="{{ route('admin.dashboard')}}">
                <i class="fa-solid fa-house fa-2xl menu-icon"></i>
                <span>{{__('Label.Dashboard')}}</span>
            </a>
        </li>
        <li class="dropdown {{ request()->routeIs('category*') ? 'active' : '' }}{{ request()->routeIs('language*') ? 'active' : '' }}{{ request()->routeIs('page*') ? 'active' : '' }}{{ request()->routeIs('avatar*') ? 'active' : '' }}">
            <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa-solid fa-sliders fa-2xl menu-icon"></i>
                <span>Basic Items</span>
            </a>
            <ul class="dropdown-menu side-submenu {{ request()->routeIs('category*') ? 'show' : '' }}{{ request()->routeIs('language*') ? 'show' : '' }}{{ request()->routeIs('page*') ? 'show' : '' }}{{ request()->routeIs('avatar*') ? 'show' : '' }}" aria-labelledby="dropdownMenuClickable">
                <li class="side_line {{ request()->routeIs('category*') ? 'active' : '' }}">
                    <a href="{{ route('category.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-shapes fa-2xl submenu-icon"></i>
                        <span>{{__('Label.Category')}}</span>
                    </a>
                </li>
                <li class="side_line {{ request()->routeIs('language*') ? 'active' : '' }}">
                    <a href="{{ route('language.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-globe fa-2xl submenu-icon"></i>
                        <span>{{__('Label.Language')}}</span>
                    </a>
                </li>
                <li class="side_line {{ request()->routeIs('avatar*') ? 'active' : '' }}">
                    <a href="{{ route('avatar.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-user-plus fa-2xl submenu-icon"></i>
                        <span>Avatar</span>
                    </a>
                </li>
                <li class="side_line {{ request()->routeIs('page*') ? 'active' : '' }}">
                    <a href="{{ route('page.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-book-open-reader fa-2xl submenu-icon"></i>
                        <span>{{__('Label.Pages')}}</span>
                    </a>
                </li>
            </ul>
        </li>
        <li class="side_line {{ request()->routeIs('user*') ? 'active' : '' }}">
            <a href="{{ route('user.index') }}">
                <i class="fa-solid fa-users fa-2xl menu-icon"></i>
                <span>{{__('Label.Users')}}</span>
            </a>
        </li>
        <li class="side_line {{ request()->routeIs('artist*') ? 'active' : '' }}">
            <a href="{{ route('artist.index') }}">
                <i class="fa-solid fa-user-tie fa-2xl menu-icon"></i>
                <span>Artist</span>
            </a>
        </li>
        <li class="dropdown {{ request()->routeIs('section.index') ? 'active' : '' }}{{ request()->routeIs('banner.index') ? 'active' : '' }}">
            <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa-solid fa-home fa-2xl menu-icon"></i>
                <span>Home</span>
            </a>
            <ul class="dropdown-menu side-submenu {{ request()->routeIs('section.index') ? 'show' : '' }}{{ request()->routeIs('banner.index') ? 'show' : '' }}" aria-labelledby="dropdownMenuClickable">
                <li class="side_line {{ request()->routeIs('banner.index') ? 'active' : '' }}">
                    <a href="{{ route('banner.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-scroll fa-2xl submenu-icon"></i>
                        <span>Banner</span>
                    </a>
                </li>
                <li class="side_line {{ request()->routeIs('section.index') ? 'active' : '' }}">
                    <a href="{{ route('section.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-bars-staggered fa-2xl submenu-icon"></i>
                        <span>Section</span>
                    </a>
                </li>
            </ul>
        </li>
        <li class="dropdown {{ request()->routeIs('audiobook*') ? 'active' : '' }}{{ request()->routeIs('sectionaudiobook*') ? 'active' : '' }}{{ request()->routeIs('banneraudiobook.index') ? 'active' : '' }}">
            <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa-solid fa-microphone fa-2xl menu-icon"></i>
                <span>Audio Book</span>
            </a>
            <ul class="dropdown-menu side-submenu {{ request()->routeIs('audiobook*') ? 'show' : '' }}{{ request()->routeIs('sectionaudiobook*') ? 'show' : '' }}{{ request()->routeIs('banneraudiobook.index') ? 'show' : '' }}" aria-labelledby="dropdownMenuClickable">
                <li class="side_line {{ request()->routeIs('banneraudiobook.index') ? 'active' : '' }}">
                    <a href="{{ route('banneraudiobook.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-scroll fa-2xl submenu-icon"></i>
                        <span>Banner</span>
                    </a>
                </li>
                <li class="side_line {{ request()->routeIs('sectionaudiobook*') ? 'active' : '' }}">
                    <a href="{{ route('sectionaudiobook.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-bars-staggered fa-2xl submenu-icon"></i>
                        <span>Section</span>
                    </a>
                </li>
                <li class="side_line {{ request()->routeIs('audiobook*') ? 'active' : '' }}">
                    <a href="{{ route('audiobook.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-microphone fa-2xl submenu-icon"></i>
                        <span>Audio Book</span>
                    </a>
                </li>
            </ul>
        </li>
        <li class="dropdown {{ request()->routeIs('novel*') ? 'active' : '' }}{{ request()->routeIs('sectionnovel*') ? 'active' : '' }}{{ request()->routeIs('bannernovel.index') ? 'active' : '' }}">
            <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa-solid fa-book fa-2xl menu-icon"></i>
                <span>Novel</span>
            </a>
            <ul class="dropdown-menu side-submenu {{ request()->routeIs('novel*') ? 'show' : '' }}{{ request()->routeIs('sectionnovel*') ? 'show' : '' }}{{ request()->routeIs('bannernovel.index') ? 'show' : '' }}" aria-labelledby="dropdownMenuClickable">
                <li class="side_line {{ request()->routeIs('bannernovel.index') ? 'active' : '' }}">
                    <a href="{{ route('bannernovel.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-scroll fa-2xl submenu-icon"></i>
                        <span>Banner</span>
                    </a>
                </li>
                <li class="side_line {{ request()->routeIs('sectionnovel*') ? 'active' : '' }}">
                    <a href="{{ route('sectionnovel.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-bars-staggered fa-2xl submenu-icon"></i>
                        <span>Section</span>
                    </a>
                </li>
                <li class="side_line {{ request()->routeIs('novel*') ? 'active' : '' }}">
                    <a href="{{ route('novel.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-book fa-2xl submenu-icon"></i>
                        <span>Novel</span>
                    </a>
                </li>
            </ul>
        </li>
        <li class="side_line {{ request()->routeIs('threads*') ? 'active' : '' }}">
            <a href="{{ route('threads.index') }}">
                <i class="fa-brands fa-threads fa-2xl menu-icon"></i>
                <span>Threads</span>
            </a>
        </li>
        <li class="dropdown {{ request()->routeIs('music*') ? 'active' : '' }}{{ request()->routeIs('sectionmusic*') ? 'active' : '' }}">
            <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa-solid fa-music fa-2xl menu-icon"></i>
                <span>Music</span>
            </a>
            <ul class="dropdown-menu side-submenu {{ request()->routeIs('music*') ? 'show' : '' }}{{ request()->routeIs('sectionmusic*') ? 'show' : '' }}" aria-labelledby="dropdownMenuClickable">
                <li class="side_line {{ request()->routeIs('sectionmusic*') ? 'active' : '' }}">
                    <a href="{{ route('sectionmusic.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-bars-staggered fa-2xl submenu-icon"></i>
                        <span>Section</span>
                    </a>
                </li>
                <li class="side_line {{ request()->routeIs('music*') ? 'active' : '' }}">
                    <a href="{{ route('music.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-music fa-2xl submenu-icon"></i>
                        <span>Music</span>
                    </a>
                </li>
            </ul>
        </li>
        <li class="side_line {{ request()->routeIs('reviews*') ? 'active' : '' }}">
            <a href="{{ route('reviews.index') }}">
                <i class="fa-solid fa-comments fa-2xl menu-icon"></i>
                <span>Reviews</span>
            </a>
        </li>
        <li class="side_line {{ request()->routeIs('notification*') ? 'active' : '' }}">
            <a href="{{ route('notification.index') }}">
                <i class="fa-solid fa-bell fa-2xl menu-icon"></i>
                <span>Notification</span>
            </a>
        </li>
        <li class="side_line {{ request()->routeIs('wallet*') ? 'active' : '' }}">
            <a href="{{ route('wallet.index') }}">
                <i class="fa-solid fa-wallet fa-2xl menu-icon"></i>
                <span>Wallet</span>
            </a>
        </li>
        <li class="dropdown {{ request()->routeIs('package*') ? 'active' : '' }}{{ request()->routeIs('payment*') ? 'active' : '' }}{{ request()->routeIs('transaction*') ? 'active' : '' }}">
            <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa-solid fa-money-bill fa-2xl menu-icon"></i>
                <span>Subscription</span>
            </a>
            <ul class="dropdown-menu side-submenu {{ request()->routeIs('package*') ? 'show' : '' }}{{ request()->routeIs('payment*') ? 'show' : '' }}{{ request()->routeIs('transaction*') ? 'show' : '' }}">
                <li class="side_line {{ request()->routeIs('package*') ? 'active' : '' }}">
                    <a href="{{ route('package.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-box-archive fa-2xl submenu-icon"></i>
                        <span>{{__('Label.Package')}}</span>
                    </a>
                </li>
                <li class="side_line {{ request()->routeIs('transaction*') ? 'active' : '' }}">
                    <a href="{{ route('transaction.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-wallet fa-2xl submenu-icon"></i>
                        <span>{{__('Label.Transactions')}}</span>
                    </a>
                </li>
                <li class="side_line {{ request()->routeIs('payment*') ? 'active' : '' }}">
                    <a href="{{ route('payment.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-money-bill-wave fa-2xl submenu-icon"></i>
                        <span>{{__('Label.Payment')}}</span>
                    </a>
                </li>
            </ul>
        </li>
        <li class="dropdown {{ request()->routeIs('admob*') ? 'active' : '' }}{{ request()->routeIs('fbads*') ? 'active' : '' }}">
            <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa-solid fa-rectangle-ad fa-2xl menu-icon"></i>
                <span>Ads</span>
            </a>
            <ul class="dropdown-menu side-submenu {{ request()->routeIs('admob*') ? 'show' : '' }}{{ request()->routeIs('fbads*') ? 'show' : '' }}">
                <li class="side_line {{ request()->routeIs('admob*') ? 'active' : '' }}">
                    <a href="{{ route('admob.index') }}" class="dropdown-item">
                        <i class="fa-brands fa-square-google-plus fa-2xl submenu-icon"></i>
                        <span>AdMob</span>
                    </a>
                </li>
                <!-- <li class="side_line {{ request()->routeIs('fbads*') ? 'active' : '' }}">
                    <a href="{{ route('fbads.index') }}" class="dropdown-item">
                        <i class="fa-brands fa-square-facebook fa-2xl submenu-icon"></i>
                        <span>FaceBook Ads</span>
                    </a>
                </li> -->
            </ul>
        </li>
        <li class="dropdown {{ request()->routeIs('setting*') ? 'active' : '' }}{{ request()->routeIs('smtp*') ? 'active' : '' }}{{ request()->routeIs('system.setting*') ? 'active' : '' }}{{ request()->routeIs('earningsetting*') ? 'active' : '' }}">
            <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa-solid fa-gears fa-2xl menu-icon"></i>
                <span>Settings</span>
            </a>
            <ul class="dropdown-menu side-submenu {{ request()->routeIs('setting*') ? 'show' : '' }}{{ request()->routeIs('smtp*') ? 'show' : '' }}{{ request()->routeIs('system.setting*') ? 'show' : '' }}{{ request()->routeIs('earningsetting*') ? 'show' : '' }}">
                <li class="side_line {{ request()->routeIs('setting*') ? 'active' : '' }}{{ request()->routeIs('smtp*') ? 'active' : '' }}">
                    <a href="{{ route('setting') }}" class="dropdown-item">
                        <i class="fa-solid fa-gear fa-2xl submenu-icon"></i>
                        <span>App Settings</span>
                    </a>
                </li>
                <li class="side_line {{ request()->routeIs('system.setting*') ? 'active' : '' }}">
                    <a href="{{ route('system.setting.index') }}" class="dropdown-item">
                        <i class="fa-solid fa-screwdriver-wrench fa-2xl submenu-icon"></i>
                        <span>System Settings</span>
                    </a>
                </li>
                <li class="side_line {{ request()->routeIs('earningsetting*') ? 'active' : '' }}">
                    <a href="{{ route('earningsetting') }}" class="dropdown-item">
                        <i class="fa-solid fa-sliders fa-2xl submenu-icon"></i>
                        <span>Earning Setting</span>
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <a href="{{ route('admin.logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                <i class="fa-solid fa-arrow-right-from-bracket fa-2xl menu-icon"></i>
                <span>{{__('Label.Logout')}}</span>
            </a>

            <form id="logout-form" action="{{ route('admin.logout') }}" method="GET" class="d-none">
                @csrf
            </form>
        </li>
    </ul>
</div>