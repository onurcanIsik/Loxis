import 'package:auto_route/auto_route.dart';
import 'package:loxis/core/utils/router/app_router.gr.dart';
import 'package:loxis/core/utils/router/enum/router_enum.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      page: SplashRoute.page,
      path: AppRouterKeys.splashRoute.path,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),

    CustomRoute(
      page: HomeRoute.page,
      path: AppRouterKeys.homeRoute.path,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ];
}
