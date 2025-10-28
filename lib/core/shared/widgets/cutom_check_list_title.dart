import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';
import '../../theme/styles.dart';

class CustomCheckListTitle extends StatelessWidget {
  final bool value;
  final void Function(bool? value)? onChanged;
  final String? title;
  final Color? tileColor;
  final double? radius;
  final AlignmentGeometry titleAlignment;
  const CustomCheckListTitle({
    super.key,
    required this.value,
    this.onChanged,
    this.title,
    this.tileColor,
     this.radius,
    required this.titleAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        InkWell(
          onTap: onChanged != null ? () => onChanged!(!value) : null,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: value
                  ? null
                  : Border.all(color: AppColors.gray53, width: 2),
              color: value ? AppColors.primaryLight : null,
            ),
            child: Center(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: value
                    ? SvgPicture.asset(
                        AppIcons.iconsCheckmark,
                        key: ValueKey('selected'),
                        width: 15,
                        height: 15,
                      )
                    : SizedBox(
                        key: ValueKey('unselected'),
                        width: 15,
                        height: 15,
                      ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: titleAlignment,
            child: Text(
              title ?? "",
              style: Styles.regular(
                context,
                16,
              ).copyWith(color: AppColors.onBackgroundLight),
            ),
          ),
        ),
      ],
    );
  }
}
