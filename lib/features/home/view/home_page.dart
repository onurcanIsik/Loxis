import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loxis/core/constant/app_constant.dart';
import 'package:loxis/core/extensions/extensions.dart';
import 'package:loxis/core/utils/localization/locale_keys.g.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AppConstants.APP_LOGO),
        title: Text("Loxis"),
        actions: [
          IconButton(icon: Icon(LucideIcons.settings), onPressed: () {}),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: context.dynamicWidth(0.9),
                height: context.dynamicHeight(0.07),

                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.homePage_createCapsule.tr(),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
