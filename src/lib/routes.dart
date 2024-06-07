import 'package:go_router/go_router.dart';

import 'package:adopte_1_candidat/loading.dart';
import 'package:adopte_1_candidat/splash_screen.dart';
import 'package:adopte_1_candidat/login/login.dart';
import 'package:adopte_1_candidat/signup/signup.dart';
import 'package:adopte_1_candidat/signup/select_softskills.dart';
import 'package:adopte_1_candidat/signup/sort_softskills.dart'; 
import 'package:adopte_1_candidat/home/home.dart';

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/selectSoftSkills',
    routes: <RouteBase>[
      GoRoute(
        path: '/loading',
        name: 'loading',
        builder: (context, state) => const Loading(),
      ),
      GoRoute(
        path: '/splashScreen',
        name: 'splashScreen',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const Signup(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) =>  HomePage(),
      ),
      GoRoute(
        path: '/selectSoftSkills',
        name: 'selectSoftSkills',
        builder: (context, state) => const SelectSoftSkills(),
      ),
      GoRoute(
        path: '/sortSoftSkills',
        name: 'sortSoftSkills',
        builder: (context, state) => SortSoftSkills(),
      ),
    ],
  );
}
