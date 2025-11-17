import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/choice_decorated_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultipleChoiceContainer extends StatelessWidget {
  final bool isSelected;
  final String text;
  const MultipleChoiceContainer({
    super.key,
    required this.isSelected,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceDecoratedContainer(
      isSelected: isSelected,
      child: Row(
        children: [
          Container(
            width: 20.w,
            height: 20.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.r),
              color: isSelected ? AppColors.prime : null,
              border: Border.all(width: 2, color: AppColors.prime),
            ),
            child: isSelected
                ? Center(
                    child: Icon(
                      Icons.check_rounded,
                      color: AppColors.white,
                      size: 16.sp,
                    ),
                  )
                : null,
          ),
          SizedBox(width: 18.w),
          Text(text, style: Styles.regular(context, 14.sp)),
        ],
      ),
    );
  }
}
