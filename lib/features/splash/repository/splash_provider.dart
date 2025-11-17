import 'package:flutter_riverpod/legacy.dart';
import 'package:loxis/features/splash/repository/splash_notifier.dart';
import 'package:loxis/features/splash/repository/splash_state.dart';

final splashProvider = StateNotifierProvider<SplashNotifier, SplashState>(
  (ref) => SplashNotifier(),
);
