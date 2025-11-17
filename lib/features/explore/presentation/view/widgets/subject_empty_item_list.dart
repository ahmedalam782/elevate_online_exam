import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/shared/widgets/custom_button.dart';
import 'package:elevate_online_exam/core/theme/app_images.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/languages/locale_keys.g.dart';

class SubjectEmptyItemList extends StatelessWidget {
  const SubjectEmptyItemList({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppImages.imagesNoData, width: 150, height: 150),
        SizedBox(height: 16),
        Text(
          LocaleKeys.subjects_no_subjects_found.tr(),
          style: Styles.medium(context, 16),
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420, minWidth: 300),
          child: CustomButton(
            onTap: onPressed,
            isGradient: false,
            title: LocaleKeys.custom_widget_try_again.tr(),
          ),
        ),
      ],
    );
  }
}
