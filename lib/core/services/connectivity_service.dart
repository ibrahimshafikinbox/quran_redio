import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static final Connectivity _connectivity = Connectivity();

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await _connectivity.checkConnectivity();

      if (result.contains(ConnectivityResult.none) || result.isEmpty) {
        return false;
      }

      final lookupResult = await InternetAddress.lookup(
        'google.com',
      ).timeout(const Duration(seconds: 5));

      return lookupResult.isNotEmpty && lookupResult[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  static Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;
}
