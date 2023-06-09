import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/ui/auth/login_screen.dart';
import 'package:todo/ui/auth/sign_up.dart';
import 'package:todo/ui/bottom_navigation.dart';
import 'package:todo/ui/home/home_screen.dart';
import 'package:todo/ui/todo/todo_screen.dart';

GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/home',
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: (context, state) => PageAnimation(key: state.pageKey, child: const HomeScreen()),
        ),
      ],
      builder: (context, state, child) => BottomNav(child: child),
    ),
    GoRoute(
      path: '/todo',
      pageBuilder: (context, state) => PageAnimation(key: state.pageKey, child: const TodoScreen()),
    ),
    GoRoute(path: '/login', pageBuilder: (context, state) => PageAnimation(key: state.pageKey, child: const LoginScreen()), routes: [
      GoRoute(
        path: 'signup',
        pageBuilder: (context, state) => PageAnimation(key: state.pageKey, child: const SignupScreen()),
      )
    ])
  ],
);

class PageAnimation extends CustomTransitionPage {
  PageAnimation({
    required LocalKey key,
    required super.child,
  }) : super(
          transitionDuration: const Duration(milliseconds: 300),
          key: key,
          transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
