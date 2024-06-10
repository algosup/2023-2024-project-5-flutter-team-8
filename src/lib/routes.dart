import 'package:adopte_1_candidat/certification/agile_page.dart';
import 'package:adopte_1_candidat/certification/certification_page.dart';
import 'package:adopte_1_candidat/certification/efficiency_page.dart';
import 'package:adopte_1_candidat/certification/leadership_page.dart';
import 'package:adopte_1_candidat/certification/social_page.dart';
import 'package:adopte_1_candidat/profile/notification_page.dart';
import 'package:adopte_1_candidat/profile/personal_information_page.dart';
import 'package:adopte_1_candidat/profile/profile.dart';
import 'package:adopte_1_candidat/profile/update_profile_picture.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:adopte_1_candidat/loading.dart';
import 'package:adopte_1_candidat/splash_screen.dart';
import 'package:adopte_1_candidat/login/login.dart';
import 'package:adopte_1_candidat/signup/signup.dart';
import 'package:adopte_1_candidat/signup/select_softskills.dart';
import 'package:adopte_1_candidat/signup/sort_softskills.dart';
import 'package:adopte_1_candidat/home/home.dart';
import 'package:adopte_1_candidat/emails/verify_email.dart';
import 'package:adopte_1_candidat/emails/success.dart';

final routeProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    initialLocation: '/home',
    routes: [
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
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/selectSoftSkills',
        name: 'selectSoftSkills',
        builder: (context, state) => const SelectSoftSkills(),
      ),
      GoRoute(
        path: '/sortSoftSkills',
        name: 'sortSoftSkills',
        builder: (context, state) => const SortSoftSkills(),
      ),
      GoRoute(
        path: '/certifications',
        name: 'certifications',
        builder: (context, state) =>  const CertificationPage(),
      ),
      GoRoute(
        path: '/efficiency-page',
        name: 'efficiency-page',
        builder: (context, state) =>  const EfficiencyPage(),
      ),
      GoRoute(
        path: '/leadership-page',
        name: 'leadership-page',
        builder: (context, state) =>  const LeadershipPage(),
      ),
      GoRoute(
        path: '/social-page',
        name: 'social-page',
        builder: (context, state) =>  const SocialPage(),
      ),
      GoRoute(
        path: '/agile-page',
        name: 'agile-page',
        builder: (context, state) =>  const AgilePage(),
      ),
      GoRoute(
        path: '/verifyEmail',
        name: 'verifyEmail',
        builder: (context, state) => const VerifyEmail(),
      ),
      GoRoute(
        path: '/verificationSuccessful',
        name: 'verificationSuccessful',
        builder: (context, state) => const SuccessEmailUpdate(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) =>  const ProfilePage(),
      ),
      GoRoute(
        path: '/notification-page',
        name: 'notification-page',
        builder: (context, state) =>  const NotificationPage(),
      ),
      GoRoute(
        path: '/update-profile-picture',
        name: 'update-profile-picture',
        builder: (context, state) =>  const UpdateProfilePicture(),
      ),
      GoRoute(
        path: '/personal-information-page',
        name: 'personal-information-page',
        builder: (context, state) =>  const PersonalInformationPage(),
      ),
    ],
  );
  return router;
});