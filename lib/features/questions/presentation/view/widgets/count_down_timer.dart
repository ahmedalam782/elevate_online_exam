import 'dart:async';
import 'package:elevate_online_exam/core/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CountdownTimer extends StatefulWidget {
  final int totalSeconds; // total seconds (e.g., 1800 for 30 minutes)
  final VoidCallback onFinished; // callback when time ends
  final TextStyle? textStyle; // optional custom style

  const CountdownTimer({
    Key? key,
    required this.totalSeconds,
    required this.onFinished,
    this.textStyle,
  }) : super(key: key);

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.totalSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 1) {
        timer.cancel();
        widget.onFinished();
      }
      setState(() {
        _remainingSeconds--;
      });
    });
  }

  String get _formattedTime {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  Color get _textColor {
    final half = widget.totalSeconds / 2;
    return _remainingSeconds >= half
        ? const Color(0xFF11CE19) // Green
        : const Color(0xFFCC1010); // Red
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.iconClock),
        SizedBox(width: 3.w),
        Text(
          _formattedTime,
          style:
              widget.textStyle?.copyWith(color: _textColor) ??
              TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: _textColor,
              ),
        ),
      ],
    );
  }
}
