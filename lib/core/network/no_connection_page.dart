import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loxis/core/utils/localization/locale_keys.g.dart';

import 'connectivity_provider.dart';

class NoInternetPage extends ConsumerWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.signal_wifi_off,
                  size: 72,
                  color: Colors.grey.shade700,
                ),
                const SizedBox(height: 20),
                Text(
                  LocaleKeys.noConnection_noConnectionTitle.tr(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  LocaleKeys.noConnection_noConnectionSubtitle.tr(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    ref.invalidate(connectivityProvider);
                  },
                  child: Text(LocaleKeys.buttons_tryAgain.tr()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
