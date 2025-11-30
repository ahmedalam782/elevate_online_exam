import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared/widgets/custom_cached_image.dart';
import '../../../../../core/shared/widgets/image_picker_with_cropper.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../view_model/cubit/profile_cubit.dart';
import '../../view_model/cubit/profile_events.dart';
import '../../view_model/cubit/profile_states.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          clipBehavior: Clip.none,
          children: [
            state.changeProfileImageState?.imagePath != null
                ? Center(
                    child: ClipOval(
                      child: Image.file(
                        state.changeProfileImageState!.imagePath,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : CustomCachedImage(imagePath: ""),
            Positioned(
              bottom: state.changeProfileImageState?.imagePath != null ? 5 : 30,
              right: 140,
              child: InkWell(
                onTap: () {
                  ImagePickerWithCropper().showPhotoPickerBottomSheet(context, (
                    imageFile,
                  ) async {
                    if (imageFile != null) {
                      profileCubit.doIntent(
                        ChangeProfileImageEvent(imagePath: imageFile),
                      );
                    }
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 24,
                  height: 24,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.secondaryDark,
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 16,
                    color: AppColors.onSecondaryDark,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
