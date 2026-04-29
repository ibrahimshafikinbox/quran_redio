import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SleepTimerBottomSheet extends StatefulWidget {
  const SleepTimerBottomSheet({super.key});

  @override
  State<SleepTimerBottomSheet> createState() => _SleepTimerBottomSheetState();
}

class _SleepTimerBottomSheetState extends State<SleepTimerBottomSheet> {
  int selectedHours = 0;
  int selectedMinutes = 0;
  int selectedSeconds = 0;
  int selectedPreset = -1; // -1 = none selected

  final List<String> presets = ['ساعتين', 'ساعة و نصف', 'نصف ساعة'];

  late FixedExtentScrollController _hoursController;
  late FixedExtentScrollController _minutesController;
  late FixedExtentScrollController _secondsController;

  @override
  void initState() {
    super.initState();
    _hoursController = FixedExtentScrollController(initialItem: selectedHours);
    _minutesController = FixedExtentScrollController(
      initialItem: selectedMinutes,
    );
    _secondsController = FixedExtentScrollController(
      initialItem: selectedSeconds,
    );
  }

  @override
  void dispose() {
    _hoursController.dispose();
    _minutesController.dispose();
    _secondsController.dispose();
    super.dispose();
  }

  void _selectPreset(int index) {
    setState(() {
      selectedPreset = index;
      switch (index) {
        case 0: // ساعتين
          selectedHours = 2;
          selectedMinutes = 0;
          selectedSeconds = 0;
          break;
        case 1: // ساعة و نصف
          selectedHours = 1;
          selectedMinutes = 30;
          selectedSeconds = 0;
          break;
        case 2: // نصف ساعة
          selectedHours = 0;
          selectedMinutes = 30;
          selectedSeconds = 0;
          break;
      }
      _hoursController.jumpToItem(selectedHours);
      _minutesController.jumpToItem(selectedMinutes);
      _secondsController.jumpToItem(selectedSeconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 12.h),
          // Handle bar
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 20.h),
          // Title
          Text(
            'حدد متى تريد إيقاف البث المباشر',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 20.h),
          // Preset buttons
          _buildPresetButtons(),
          SizedBox(height: 24.h),
          // Time Picker
          _buildTimePicker(),
          SizedBox(height: 24.h),
          // Start Timer Button
          _buildStartButton(),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget _buildPresetButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: List.generate(presets.length, (index) {
          final isSelected = selectedPreset == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => _selectPreset(index),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF1D4A3D)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(
                    color: const Color(0xFF1D4A3D),
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    presets[index],
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF1D4A3D),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTimePicker() {
    return Container(
      height: 200.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          // Hours
          Expanded(
            child: _buildPickerColumn(
              label: 'ساعات',
              itemCount: 24,
              controller: _hoursController,
              onChanged: (value) {
                setState(() {
                  selectedHours = value;
                  selectedPreset = -1;
                });
              },
            ),
          ),
          // Minutes
          Expanded(
            child: _buildPickerColumn(
              label: 'دقائق',
              itemCount: 60,
              controller: _minutesController,
              onChanged: (value) {
                setState(() {
                  selectedMinutes = value;
                  selectedPreset = -1;
                });
              },
            ),
          ),
          // Seconds
          Expanded(
            child: _buildPickerColumn(
              label: 'ثواني',
              itemCount: 60,
              controller: _secondsController,
              onChanged: (value) {
                setState(() {
                  selectedSeconds = value;
                  selectedPreset = -1;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPickerColumn({
    required String label,
    required int itemCount,
    required FixedExtentScrollController controller,
    required Function(int) onChanged,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 8.h),
        Expanded(
          child: Stack(
            children: [
              // Selection highlight
              Center(
                child: Container(
                  height: 50.h,
                  margin: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              // Picker
              ListWheelScrollView.useDelegate(
                controller: controller,
                itemExtent: 50.h,
                perspective: 0.005,
                diameterRatio: 1.5,
                physics: const FixedExtentScrollPhysics(),
                onSelectedItemChanged: onChanged,
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: itemCount,
                  builder: (context, index) {
                    return Center(
                      child: Text(
                        index.toString().padLeft(2, '0'),
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStartButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: GestureDetector(
        onTap: () {
          final totalSeconds =
              (selectedHours * 3600) + (selectedMinutes * 60) + selectedSeconds;
          Navigator.pop(context, totalSeconds);
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 14.h),
          decoration: BoxDecoration(
            color: const Color(0xFF1D4A3D),
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.alarm, color: Colors.white, size: 22.sp),
              SizedBox(width: 10.w),
              Text(
                'بدأ التوقيت',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
