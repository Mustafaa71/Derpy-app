import 'package:derpy/View/Pages/Dashboard/dashboard.dart';
import 'package:derpy/View/Pages/home_page.dart';
import 'package:derpy/View/Pages/main_page.dart';
import 'package:derpy/View/Pages/search_page.dart';
import 'package:derpy/View/Pages/setting_page.dart';
import 'package:go_router/go_router.dart';

class AppRouterController {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const Dashboard(),
      ),
      GoRoute(
        path: '/setting',
        builder: (context, state) => const SettingPage(),
      ),
    ],
  );
}
