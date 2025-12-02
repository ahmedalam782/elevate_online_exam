import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountdownTimer extends StatefulWidget {
  final int totalMinutes; // e.g. 30 for 30 minutes
  final VoidCallback onFinished; // callback when time ends
  final TextStyle? textStyle; // optional custom style
  final bool isDone;

  const CountdownTimer({
    Key? key,
    required this.totalMinutes,
    required this.onFinished,
    this.textStyle,
    required this.isDone,
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
    _remainingSeconds = widget.totalMinutes * 60;

    _startTimer();
    if (widget.isDone == true) {
      print("INSIDE");
      _timer?.cancel();
    }
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
    final halfTimeInSeconds = (widget.totalMinutes * 60) / 2;
    return _remainingSeconds >= halfTimeInSeconds
        ? const Color(0xFF11CE19) // Green if above half
        : const Color(0xFFCC1010); // Red if below half
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formattedTime,
      style:
          widget.textStyle?.copyWith(color: _textColor) ??
          TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            color: _textColor,
          ),
    );
  }
}
