import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../services/connectivity_service.dart';
import 'no_internet_dialog.dart';
import '../colors/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../helpers/spacing.dart';

class ConnectivityWrapper extends StatefulWidget {
  final Widget child;
  const ConnectivityWrapper({super.key, required this.child});

  @override
  State<ConnectivityWrapper> createState() => _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
  bool _hasInternet = true;
  bool _isChecking = true;

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
        body: Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }

    if (_hasInternet) {
      return widget.child;
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi_off_rounded,
                size: 80.sp,
                color: AppColors.grey,
              ),
              Spacing.v16,
              Text(
                'لا يوجد اتصال بالإنترنت',
                style: AppTextStyle.textStyleBoldBlack,
                textAlign: TextAlign.center,
              ),
              Spacing.v24,
              ElevatedButton(
                onPressed: _checkConnectivity,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  'إعادة المحاولة',
                  style: AppTextStyle.textStyleWhiteSemiBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
