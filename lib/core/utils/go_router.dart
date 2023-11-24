import 'package:dating/Features/home/presentation/view/home_view.dart';
import 'package:dating/Features/Account/presentation/view/enter_phone_view.dart';
import 'package:dating/Features/Account/presentation/view/on_boarding_view.dart';
import 'package:dating/Features/Account/presentation/view/pin_code_verf_view.dart';
import 'package:dating/Features/Account/presentation/view/sign_up_view.dart';
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
        GoRoute(
          path: 'homeView',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeView();
          },
        ),
        GoRoute(
          path: 'pinCodeVerf',
          builder: (BuildContext context, GoRouterState state) {
            return const PinCodeVerificationView();
          },
        ),
        GoRoute(
          path: 'enterPhone',
          builder: (BuildContext context, GoRouterState state) {
            return const EnterPhoneView();
          },
        ),
      ],
    ),
  ],
);
