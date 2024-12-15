import 'package:e_learning/config/routes/app_routes.dart';
import 'package:e_learning/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/utils/constants.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/course/presentation/bloc/course/course_bloc.dart';
import '../../features/course/presentation/screens/course_screen.dart';
import '../../features/intro/presentation/screens/onboarding_screen.dart';
import '../../features/intro/presentation/screens/splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import '../../features/main/presentation/screens/main_screen.dart';

class AppRouterConfig {
  static GoRouter get router => _router;
  static Page<void> _buildPageWithTransition(
    BuildContext context,
    GoRouterState state, {
    required Widget child,
    PageTransitionType transitionType = PageTransitionType.fade,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      arguments: state.extra,
      transitionDuration: Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return PageTransition(
          type: transitionType,
          child: child,
          duration: Duration(milliseconds: 300),
        ).buildTransitions(context, animation, secondaryAnimation, child);
      },
    );
  }

  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.initial,
        pageBuilder: (context, state) {
          return _buildPageWithTransition(
            context,
            state,
            child: SplashScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        pageBuilder: (context, state) {
          return _buildPageWithTransition(
            context,
            state,
            child: OnboardingScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.login,
        pageBuilder: (context, state) {
          return _buildPageWithTransition(
            context,
            state,
            child: LoginScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.register,
        pageBuilder: (context, state) {
          return _buildPageWithTransition(
            context,
            state,
            child: RegisterScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        pageBuilder: (context, state) {
          return _buildPageWithTransition(
            context,
            state,
            child: ForgetPasswordScreen(),
            transitionType: PageTransitionType.leftToRightWithFade,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.main,
        //redirect: Guards.authGuard,
        pageBuilder: (context, state) {
          return _buildPageWithTransition(
            context,
            state,
            child: MainScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.course,
        pageBuilder: (context, state) {
          return _buildPageWithTransition(
            context,
            state,
            child: BlocProvider.value(
                value: locator<CourseBloc>()
                  ..add(GetCourseDetailsEvent(id: state.extra as String)),
                child: CourseScreen()),
          );
        },
      ),
    ],
  );
}
