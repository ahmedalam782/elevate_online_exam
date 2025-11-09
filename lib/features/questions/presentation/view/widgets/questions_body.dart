// TODO: presentation QuestionsBody
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/count_down_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionsBody extends StatelessWidget {
  const QuestionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 12.h),
          Row(
            children: [
              Text(""),
              CountdownTimer(
                onFinished: () {
                  print("FINISED");
                },
                totalSeconds: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
