import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loxis/core/network/no_connection_page.dart';
import 'connectivity_provider.dart';

/// child: genelde MaterialApp / Router
class ConnectivityGate extends ConsumerWidget {
  final Widget child;
  final bool forceSplashOnOffline; // offline olunca splash'e yönlendirilsin mi
  const ConnectivityGate({
    super.key,
    required this.child,
    this.forceSplashOnOffline = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(connectivityProvider);

    return async.when(
      data: (hasInternet) {
        if (!hasInternet) {
          // internet yok: gösterilecek şey:
          // 1) forceSplashOnOffline true ise NoInternetPage ile değiştir
          // 2) false ise sadece child içinde banner göster (opsiyonel)
          if (forceSplashOnOffline) {
            return const NoInternetPage();
          } else {
            // örnek: child widget'ı return ederken üstte banner gösterebilirsin
            return Stack(
              children: [
                child,
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Material(
                    elevation: 6,
                    child: Container(
                      color: Colors.orange,
                      padding: const EdgeInsets.all(8),
                      child: const SafeArea(
                        bottom: false,
                        child: Center(
                          child: Text(
                            'İnternet bağlantısı yok',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        }
        // internet var ise normal akış
        return child;
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) {
        // hata olursa child göster ama logla
        return child;
      },
    );
  }
}
