import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:flutter/material.dart';

class RowSpan extends StatelessWidget {
  const RowSpan({super.key, required this.title, required this.spanTitle});
  final String title;
  final String spanTitle;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        style: Styles.regular(context, 13, color: AppColors.gray53),
        children: [
          TextSpan(
            text: spanTitle,
            style: Styles.medium(context, 13, color: AppColors.black),
          ),
        ],
      ),
    );
  }
}