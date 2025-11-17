import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loxis/core/services/auth/auth_service.dart';
import 'package:loxis/core/utils/router/app_router.gr.dart';
import 'package:loxis/features/splash/repository/splash_state.dart';
import 'package:flutter_riverpod/legacy.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  final AuthService _authService = AuthService();

  SplashNotifier() : super(SplashState());

  Future<void> signAnonymous(BuildContext context) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final result = await _authService.signInAnonymously();
    result.fold(
      (failure) =>
          state = state.copyWith(isLoading: false, errorMessage: failure),
      (_) async {
        state = state.copyWith(isLoading: false);

        if (context.mounted) {
          context.router.replaceAll([HomeRoute()]);
        }
      },
    );
  }
}
