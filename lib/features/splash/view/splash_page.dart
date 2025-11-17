import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loxis/core/constant/app_constant.dart';
import 'package:loxis/core/utils/localization/locale_keys.g.dart';
import 'package:loxis/core/utils/router/enum/router_enum.dart';
import 'package:loxis/features/splash/repository/splash_provider.dart';
import 'package:loxis/features/splash/widgets/gradient_text.dart';

@RoutePage()
class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashNoti = ref.read(splashProvider.notifier);
    final splashState = ref.watch(splashProvider);

    final Gradient loxisGradient = const LinearGradient(
      colors: [Color(0xFF6C63FF), Color(0xFF8B80FF), Color(0xFF00D4FF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    useEffect(() {
      final sub = FirebaseAuth.instance.authStateChanges().listen((user) async {
        if (!context.mounted) return;

        if (user == null) {
          context.router.replacePath(AppRouterKeys.splashRoute.path);
        } else {
          if (context.mounted) {
            context.router.replacePath(AppRouterKeys.homeRoute.path);
          }
        }
      });

      return sub.cancel;
    }, []);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: splashState.isLoading == false
            ? () async {
                await splashNoti.signAnonymous(context);
              }
            : null,
        label: splashState.isLoading == false
            ? Text(
                LocaleKeys.buttons_startBtn.tr(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            : CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
        icon: const Icon(Icons.arrow_forward),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -100,
                left: -100,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    gradient: loxisGradient,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                bottom: -100,
                right: -100,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    gradient: loxisGradient,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppConstants.APP_LOGO,
                    width: MediaQuery.of(context).size.width * 0.55,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 28),
                  GradientText(
                    text: LocaleKeys.splashPage_welcomeText.tr(),
                    gradient: loxisGradient,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
