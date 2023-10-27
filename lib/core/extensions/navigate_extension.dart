import 'package:bloc_1/core/constants/enums/auth_enums.dart';
import 'package:bloc_1/core/view/auth/login_view.dart';
import 'package:bloc_1/core/view/home/home_view.dart';
import 'package:flutter/material.dart';

extension NavigateExtension on AuthStatus {
  Widget get firstView {
    switch (this) {
      case AuthStatus.authenticated:
        return const HomeView();
      case AuthStatus.guest:
        return const LoginView();
      case AuthStatus.unknown:
        break;
    }
    return const LoginView();
  }
}