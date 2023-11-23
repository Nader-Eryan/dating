import 'package:dating/Features/newAccount/presentation/view/on_boarding_view.dart';
import 'package:dating/Features/newAccount/presentation/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const OnBoardingView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'signUp',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpView();
          },
        ),
        GoRoute(
          path: 'onBoarding',
          builder: (BuildContext context, GoRouterState state) {
            return const OnBoardingView();
          },
        ),
      ],
    ),
  ],
);
