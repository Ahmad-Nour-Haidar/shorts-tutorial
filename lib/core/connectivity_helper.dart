import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shorts_tutorial/print.dart';

class ConnectivityHelper {
  final _connectivity = Connectivity();

  Stream<ConnectivityResult> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;

  Future<bool> get isConnect async {
    final result = handelConnectivity(await _connectivity.checkConnectivity());
    log(result.toString());
    return result;
  }

  bool handelConnectivity(ConnectivityResult result) {
    printme.yellow(result);
    switch (result) {
      case ConnectivityResult.bluetooth:
        return true;
      case ConnectivityResult.wifi:
        return true;
      case ConnectivityResult.ethernet:
        return true;
      case ConnectivityResult.mobile:
        return true;
      case ConnectivityResult.vpn:
        return true;
      case ConnectivityResult.other:
        return true;
      case ConnectivityResult.none:
        return false;
    }
  }
}
