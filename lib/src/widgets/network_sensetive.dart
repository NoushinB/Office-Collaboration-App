import 'package:flutter/material.dart';
import 'package:mulki_zerin/src/enums/enums.dart';
import 'package:mulki_zerin/src/widgets/no_internet_connection.dart';
import 'package:provider/provider.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget child;
  final VoidCallback callback;
  final double opacity;

  NetworkSensitive({
    this.child,
    this.callback,
    this.opacity = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    // Get our connection status from the provider
    var connectionStatus = Provider.of<ConnectivityStatus>(context);
    if (connectionStatus == ConnectivityStatus.Offline) {
      return Center(
        child: NoInternetConnection(
          assetImage: "assets/images/no-internet.png",
          title: "Offline",
          description: "Please check your internet connection",
          showRetryButton: true,
          retryCallback: () => callback,
        ),
      );
    }
    return child;
  }
}
