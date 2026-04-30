import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash/core/services/connectivity_service.dart';
import 'package:splash/core/widgets/no_internet_dialog.dart' show NoInternetDialog;
import 'package:splash/features/main/main_view.dart';
  
class ConnectivityWrapper extends StatefulWidget {
  const ConnectivityWrapper({super.key});

  @override
  State<ConnectivityWrapper> createState() => _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
  bool _isChecking = true;
  bool _hasInternet = false;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    setState(() => _isChecking = true);

    final hasInternet = await ConnectivityService.hasInternetConnection();

    setState(() {
      _hasInternet = hasInternet;
      _isChecking = false;
    });

    if (!hasInternet && mounted) {
      _showNoInternetDialog();
    }
  }

  void _showNoInternetDialog() {
    NoInternetDialog.show(context, () {
      Navigator.of(context).pop();
      _checkConnectivity();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isChecking) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(color: Colors.teal)),
      );
    }

    if (_hasInternet) {
      return const Directionality(
        textDirection: TextDirection.rtl,
        child: MainNavigationPage(),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off, size: 80.sp, color: Colors.grey),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: _checkConnectivity,
              child: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }
}
