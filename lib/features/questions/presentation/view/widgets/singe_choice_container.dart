import 'package:elevate_online_exam/core/theme/app_colors.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:elevate_online_exam/features/questions/domain/entities/answer_entity.dart';
import 'package:elevate_online_exam/features/questions/presentation/view/widgets/choice_decorated_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingeChoiCeContainer extends StatelessWidget {
  final bool isSelected;
  final AnswerEntity answer;
  const SingeChoiCeContainer({
    super.key,
    required this.isSelected,
    required this.answer,
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
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: AppColors.prime),
            ),
            child: isSelected
                ? Center(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: 10.w,
                      height: 10.w,
                      decoration: BoxDecoration(
                        color: AppColors.prime,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
          SizedBox(width: 18.w),
          Expanded(
            child: Text(
              answer.title,
              style: Styles.regular(context, 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
