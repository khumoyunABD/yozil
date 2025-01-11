import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yozil/presentation/presentation.dart';
import 'package:yozil/shared/shared.dart';

abstract class ScreenPath {
  static const String initialRoute = '/';
  static const String initialCheck = '/initial_check';
  static const String serviceSelector = '/service_selector';
  static const String splash = '/splash';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String verifyPhone = '/verify_phone';
  static const String home = '/home';
  static const String explore = '/explore';
  static const String appointments = '/appointments';
  static const String bookingHistory = '/booking_history';
  static const String profile = '/profile';
  static const String shopDetails = '/shop_details';
  static const String userInfo = '/user_info';
  static const String userAppointment = '/user_appointment';
  static const String userNotification = '/user_notification';
  static const String appLanguage = '/app_language';
  static const String shopContacts = '/shopContacts';
  static const String appInfo = '/app_info';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
//final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter() {
    goRouter = GoRouter(
      //initialLocation: ScreenPath.splash,
      initialLocation: ScreenPath.initialCheck,
      debugLogDiagnostics: true,
      navigatorKey: _rootNavigatorKey,
      routes: _routes,
    );
  }

  late GoRouter goRouter;

  final List<RouteBase> _routes = [
    GoRoute(
      path: ScreenPath.splash,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const SplashPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: ScreenPath.initialCheck,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const InitialCheckPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: ScreenPath.serviceSelector,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const ServiceSelectorPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: ScreenPath.signIn,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const SignInPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: ScreenPath.signUp,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const SignUpPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: ScreenPath.verifyPhone,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const PhoneVerificationPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: ScreenPath.home,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    //explore
    GoRoute(
      path: ScreenPath.explore,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const ExplorePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: ScreenPath.appointments,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const AppointmentsPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: ScreenPath.bookingHistory,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const BookingHistoryPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: ScreenPath.profile,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const ProfilePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: ScreenPath.shopDetails,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: ShopDetailPage(
            //food: state.extra as ShopModel,
            ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: ScreenPath.userInfo,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: UserInfoPage(
            //user: state.extra as UserModel,
            ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: ScreenPath.userAppointment,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: UserAppointmentPage(
            //user: state.extra as UserModel,
            ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: ScreenPath.userNotification,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: UserNotificationPage(
            //user: state.extra as UserModel,
            ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: ScreenPath.appLanguage,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const AppLanguagePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: ScreenPath.shopContacts,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const ShopContactsPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: ScreenPath.appInfo,
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const AppInfoPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      ),
    ),
  ];
}
