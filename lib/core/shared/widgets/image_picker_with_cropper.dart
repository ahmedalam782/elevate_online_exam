import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../languages/locale_keys.g.dart';
import '../../theme/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class ImagePickerWithCropper {
  File? file;
  final picker = ImagePicker();

  Future<Map<String, dynamic>?> _processImage(
    Uint8List rawBytes, {
    String? fileName,
  }) async {
    try {
      final decoded = img.decodeImage(rawBytes);
      if (decoded == null) return null;

      // Resize and compress
      final resized = img.copyResize(decoded, width: 1024); // max width
      final compressedBytes = Uint8List.fromList(
        img.encodeJpg(resized, quality: 85),
      );

      File? tempFile;
      if (!kIsWeb) {
        final tempDir = await getTemporaryDirectory();
        final tempPath = p.join(
          tempDir.path,
          fileName ?? "image_${DateTime.now().millisecondsSinceEpoch}.jpg",
        );
        tempFile = await File(tempPath).writeAsBytes(compressedBytes);
      }

      return {'file': tempFile, 'bytes': compressedBytes, 'fileName': fileName};
    } catch (e) {
      debugPrint("Image processing error: $e");
      return null;
    }
  }

  /// Crop image using image_cropper package
  Future<File?> _cropImage(String imagePath, BuildContext? context) async {
    if (kIsWeb) {
      // Web doesn't support file-based cropping with image_cropper
      return File(imagePath);
    }

    try {
      final uiSettings = <PlatformUiSettings>[
        AndroidUiSettings(
          toolbarTitle: LocaleKeys.custom_widget_crop_image.tr(),
          toolbarColor: AppColors.primaryDark,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
          ],
        ),
        IOSUiSettings(
          title: LocaleKeys.custom_widget_crop_image.tr(),
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9,
          ],
        ),
      ];

      // Only add WebUiSettings if context is available
      if (kIsWeb && context != null) {
        uiSettings.add(WebUiSettings(context: context));
      }

      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imagePath,
        uiSettings: uiSettings,
      );

      if (croppedFile != null) {
        return File(croppedFile.path);
      }
    } catch (e) {
      debugPrint('Crop error: $e');
    }
    return null;
  }

  /// Mobile: Camera with crop
  Future<File?> getImageFromCamera({
    bool enableCrop = true,
    required BuildContext context,
  }) async {
    try {
      final XFile? picked = await picker.pickImage(source: ImageSource.camera);
      if (picked != null) {
        if (enableCrop && !kIsWeb) {
          return await _cropImage(picked.path, context);
        }

        final bytes = await picked.readAsBytes();
        final result = await _processImage(
          bytes,
          fileName: p.basename(picked.path),
        );
        return result?['file'] as File?;
      }
    } catch (e) {
      debugPrint('Camera error: $e');
    }
    return null;
  }

  /// Mobile: Gallery with crop
  Future<File?> getImageFromGallery({
    bool enableCrop = true,
    BuildContext? context,
  }) async {
    try {
      final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        if (enableCrop && !kIsWeb && context!.mounted) {
          return await _cropImage(picked.path, context);
        }

        final bytes = await picked.readAsBytes();
        if (bytes.lengthInBytes <= 5 * 1024 * 1024) {
          // Return original file without compression
          final tempDir = await getTemporaryDirectory();
          final tempPath = p.join(tempDir.path, p.basename(picked.path));
          final tempFile = await File(tempPath).writeAsBytes(bytes);
          return tempFile;
        }
        final result = await _processImage(
          bytes,
          fileName: p.basename(picked.path),
        );
        return result?['file'] as File?;
      }
    } catch (e) {
      debugPrint('Gallery error: $e');
    }
    return null;
  }

  /// Web: Pick and Resize
  Future<List<dynamic>> pickImageForWeb(BuildContext context) async {
    try {
      final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        final bytes = await picked.readAsBytes();
        // Check if image size is <= 5MB (5 * 1024 * 1024 bytes)
        if (bytes.lengthInBytes <= 5 * 1024 * 1024) {
          // Return original bytes and fileName without compression
          return [bytes, picked.name];
        }
        final result = await _processImage(bytes, fileName: picked.name);
        return [result?['bytes'], result?['fileName']];
      }
    } catch (e) {
      debugPrint('Web image picker error: $e');
    }
    return [];
  }

  /// Show bottom sheet to select camera or gallery
  void showPhotoPickerBottomSheet(
    BuildContext context,
    Future<void> Function(File? image) updateImageFunction, {
    bool enableCrop = true,
  }) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      constraints: const BoxConstraints(maxWidth: 500),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () async {
                  Navigator.pop(context);
                  await updateImageFunction(
                    await getImageFromGallery(
                      enableCrop: enableCrop,
                      context: context,
                    ),
                  );
                },
                splashColor: AppColors.black.withValues(alpha: (0.1)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                leading: const Icon(Icons.photo_library_outlined),
                title: Text(
                  LocaleKeys.custom_widget_gallery.tr(),
                  style: Styles.medium(context, 16),
                ),
              ),
              const SizedBox(height: 5),
              kIsWeb
                  ? const SizedBox.shrink()
                  : ListTile(
                      onTap: () async {
                        Navigator.pop(context);
                        await updateImageFunction(
                          await getImageFromCamera(
                            enableCrop: enableCrop,
                            context: context,
                          ),
                        );
                      },
                      splashColor: AppColors.black.withValues(alpha: (0.1)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      leading: const Icon(
                        Icons.camera_outlined,
                        color: AppColors.black,
                      ),
                      title: Text(
                        LocaleKeys.custom_widget_camera.tr(),
                        style: Styles.medium(context, 16),
                      ),
                    ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
