import 'package:adopte_1_candidat/certification/agile_page.dart';
import 'package:adopte_1_candidat/certification/certification_page.dart';
import 'package:adopte_1_candidat/certification/efficiency_page.dart';
import 'package:adopte_1_candidat/certification/leadership_page.dart';
import 'package:adopte_1_candidat/certification/social_page.dart';
import 'package:adopte_1_candidat/profile/certification_profile.dart';
import 'package:adopte_1_candidat/profile/current_skills.dart';
import 'package:adopte_1_candidat/profile/jobs_liked.dart';
import 'package:adopte_1_candidat/profile/new_ranking_skills.dart';
import 'package:adopte_1_candidat/profile/notification_page.dart';
import 'package:adopte_1_candidat/profile/personal_information_page.dart';
import 'package:adopte_1_candidat/profile/profile.dart';
import 'package:adopte_1_candidat/profile/update_password_page.dart';
import 'package:adopte_1_candidat/profile/update_profile_picture.dart';
import 'package:adopte_1_candidat/profile/update_skills.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adopte_1_candidat/chat/matches.dart';
import 'package:go_router/go_router.dart';

import 'package:adopte_1_candidat/loading.dart';
import 'package:adopte_1_candidat/splash_screen.dart';
import 'package:adopte_1_candidat/login/login.dart';
import 'package:adopte_1_candidat/signup/signup.dart';
import 'package:adopte_1_candidat/signup/select_softskills.dart';
import 'package:adopte_1_candidat/signup/sort_softskills.dart';
import 'package:adopte_1_candidat/signup/set_profile_picture.dart';
import 'package:adopte_1_candidat/home/home.dart';
import 'package:adopte_1_candidat/emails/verify_email.dart';
import 'package:adopte_1_candidat/emails/success.dart';
import 'package:adopte_1_candidat/signup/location.dart';
import 'package:adopte_1_candidat/chat/chat.dart';
import 'package:adopte_1_candidat/login/forgot_password.dart';

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
        path: '/setProfilePicture',
        name: 'setProfilePicture',
        builder: (context, state) => const SetProfilePicture(),
      ),
      GoRoute(
        path: '/certifications',
        name: 'certifications',
        builder: (context, state) => const CertificationPage(),
      ),
      GoRoute(
        path: '/efficiencyPage',
        name: 'efficiencyPage',
        builder: (context, state) => const EfficiencyPage(),
      ),
      GoRoute(
        path: '/leadershipPage',
        name: 'leadershipPage',
        builder: (context, state) => const LeadershipPage(),
      ),
      GoRoute(
        path: '/socialPage',
        name: 'socialPage',
        builder: (context, state) => const SocialPage(),
      ),
      GoRoute(
        path: '/agilePage',
        name: 'agilePage',
        builder: (context, state) => const AgilePage(),
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
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/notificationPage',
        name: 'notificationPage',
        builder: (context, state) => const NotificationPage(),
      ),
      GoRoute(
        path: '/updateProfilePicture',
        name: 'updateProfilePicture',
        builder: (context, state) => const UpdateProfilePicture(),
      ),
      GoRoute(
        path: '/personalInformationPage',
        name: 'personalInformationPage',
        builder: (context, state) => const PersonalInformationPage(),
      ),
      GoRoute(
        path: '/updatePasswordPage',
        name: 'updatePasswordPage',
        builder: (context, state) => const UpdatePasswordPage(),
      ),
      GoRoute(
        path: '/currentSkillsPage',
        name: 'currentSkillsPage',
        builder: (context, state) => const CurrentSkillsPage(),
      ),
      GoRoute(
        path: '/updateSkills',
        name: 'updateSkills',
        builder: (context, state) => const UpdateSkillsPage(),
      ),
      GoRoute(
        path: '/newRankingSkills',
        name: 'newRankingSkills',
        builder: (context, state) => const NewRankingSkillsPage(),
      ),
      GoRoute(
        path: '/certificationProfilePage',
        name: 'certificationProfilePage',
        builder: (context, state) => const CertificationProfilePage(),
      ),
      GoRoute(
        path: '/jobsLikedPage',
        name: 'jobsLikedPage',
        builder: (context, state) => const JobsLikedPage(),
      ),
      GoRoute(
        path: '/locationPage',
        name: 'locationPage',
        builder: (context, state) => const SetLocation(),
      ),
      GoRoute(
        path: '/chat',
        name: 'chat',
        builder: (context, state) => const Chat(),
      ),
      GoRoute(
        path: '/matches',
        name: 'matches',
        builder: (context, state) => const Matches(),
      ),
      GoRoute(
        path: '/forgotPassword',
        name: 'forgotPassword',
        builder: (context, state) => const ForgotPassword(),
      ),
    ],
  );
  return router;
});
