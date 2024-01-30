import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityHelper {
  ConnectivityHelper._();

  static ConnectivityHelper? _connectivityHelper;

  final _connectivity = Connectivity();

  Stream<ConnectivityResult> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;

  ConnectivityHelper get instance {
    _connectivityHelper ??= ConnectivityHelper._();
    return _connectivityHelper!;
  }

  Future<bool> get isConnect async =>
      handelConnectivity(await _connectivity.checkConnectivity());

  bool handelConnectivity(ConnectivityResult result) =>
      result != ConnectivityResult.none;
}
