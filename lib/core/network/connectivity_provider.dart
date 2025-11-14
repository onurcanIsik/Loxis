// lib/core/network/connectivity_provider.dart
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final connectivityProvider = StreamProvider.autoDispose<bool>((ref) {
  final connectivity = Connectivity();

  final stream = Stream<bool>.multi((controller) async {
    // 1) Başlangıçta gerçek internet var mı?
    final initial = await InternetConnectionChecker().hasConnection;
    controller.add(initial);

    // 2) Değişiklikleri dinle (List<ConnectivityResult> / ConnectivityResult her ikisini de kapsa)
    final sub = connectivity.onConnectivityChanged.listen((_) async {
      // küçük debounce
      await Future.delayed(const Duration(milliseconds: 400));
      final hasConn = await InternetConnectionChecker().hasConnection;
      controller.add(hasConn);
    });

    ref.onDispose(() => sub.cancel());
  });

  // Art arda aynı değeri yayma
  return stream.distinct();
});
