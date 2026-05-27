import 'dart:async';

import 'package:consultant_customer_app/config/theme/app_colors.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class OtpTimerWidget extends StatefulWidget {
  const OtpTimerWidget({super.key});

  @override
  State<OtpTimerWidget> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimerWidget> {
  Timer? _timer;
  int _startSeconds = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _startSeconds = 60;

    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_startSeconds == 0) {
        setState(() {
          _timer?.cancel();
        });
      } else {
        setState(() {
          _startSeconds--;
        });
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    String minutesString = minutes.toString().padLeft(2, '0');
    String secondsString = remainingSeconds.toString().padLeft(2, '0');

    return '$minutesString:$secondsString';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Resend code in ${_formatTime(_startSeconds)}',
      style: context.textTheme.displayLarge?.copyWith(
        color: AppColors.darkGray5,
      ),
    );
  }
}
