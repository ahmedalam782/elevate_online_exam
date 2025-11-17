import 'package:elevate_online_exam/core/shared/widgets/custom_cached_image.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../domain/entities/subject_entities.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({super.key, required this.subject});
  final SubjectEntities subject;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Todo route to subject details page
        // context.push("//Todo route to subject details page", extra: subject);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: AppColors.grayCF),
          boxShadow: [
            BoxShadow(
              color: AppColors.black2A.withValues(alpha: .25),
              spreadRadius: 0,
              blurRadius: 8,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            CustomCachedImage(imagePath: subject.icon, height: 48, width: 48,),
            SizedBox(width: 12),
            Text(subject.name, style: Styles.regular(context, 16)),
          ],
        ),
      ),
    );
  }
}
