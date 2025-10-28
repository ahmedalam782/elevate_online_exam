import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_icons.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    super.key,
    this.width,
    this.height,
    required this.imagePath,
    this.fit,
    this.emptyColorFilter,
    this.color,
    this.radius,
    this.errorImage,
  });

  final double? width, height, radius;
  final String imagePath;
  final String? errorImage;
  final ColorFilter? emptyColorFilter;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final imageUrl = imagePath.isEmpty ? '' : imagePath;
    //  EndPoints.baseImageUrl}$imagePath";

    if (imagePath.isEmpty) {
      return Container(
        width: width,
        height: height,
        padding: errorImage != null && errorImage!.endsWith(".png")
            ? EdgeInsets.zero
            : const EdgeInsets.all(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 12),
          color: color ?? AppColors.primaryLight.withValues(alpha: 0.08),
        ),
        child: Center(
          child: errorImage != null && errorImage!.endsWith(".png")
              ? Image.asset(
                  errorImage!,
                  width: width,
                  height: height,
                  fit: fit ?? BoxFit.contain,
                )
              : SvgPicture.asset(
                  fit: BoxFit.contain,
                  width: width?.clamp(100, 120),
                  height: height?.clamp(100, 120),
                  errorImage ?? AppIcons.iconsNoImage,
                  colorFilter:
                      emptyColorFilter ??
                      ColorFilter.mode(AppColors.gray5F, BlendMode.srcIn),
                ),
        ),
      );
    }

    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      imageUrl: imageUrl,

      fadeInDuration: const Duration(milliseconds: 300),
      errorListener: (value) {
        log('Error loading image: $value|| $imageUrl');
      },
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 12),
          color: AppColors.primaryLight.withOpacity(0.08),
        ),
        child: Center(
          child: errorImage != null && errorImage!.endsWith(".png")
              ? Image.asset(
                  errorImage!,
                  width: width,
                  height: height,
                  fit: fit ?? BoxFit.contain,
                )
              : SvgPicture.asset(
                  fit: BoxFit.contain,
                  width: width,
                  height: height,
                  errorImage ?? AppIcons.iconsNoImage,
                  colorFilter:
                      emptyColorFilter ??
                      ColorFilter.mode(AppColors.gray5F, BlendMode.srcIn),
                ),
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 12),
          color: AppColors.primaryLight.withOpacity(0.08),
        ),
        child: SizedBox(
          width: 30,
          height: 30,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: CircularProgressIndicator(
              value: progress.progress,
              color: AppColors.backgroundLight,
              strokeCap: StrokeCap.round,
            ),
          ),
        ),
      ),
    );
  }
}
