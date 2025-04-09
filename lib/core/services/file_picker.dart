// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as p;
import 'package:sports_app/core/constant/colors.dart';

class FilePickerService {
  File? selectedImage;
  final _imagePicker = ImagePicker();
  final Logger log = Logger();

  Future<File?> pickImage() async {
    return await pickImageWithoutCompression();
  }

  Future<File?> pickVideo() async {
    File? selectedVideo;
    final video = await _imagePicker.pickVideo(source: ImageSource.gallery);
    if (video != null) selectedVideo = File(video.path);

    return selectedVideo;
  }

  Future<File?> pickImageWithCompression() async {
    File? selectedImage;
    final image50 = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );
    if (image50 != null) selectedImage = File(image50.path);

    log.d('Image50 Size: ${await image50?.length()}');

    return selectedImage;
  }

  pickImageWithoutCompression() async {
    try {
      final XFile? pickedImage = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedImage != null) {
        final File selectedImage = File(pickedImage.path);
        final extension = p.extension(selectedImage.path).toLowerCase();

        if (extension == '.jpg' ||
            extension == '.jpeg' ||
            extension == '.png' ||
            extension == '.gif' ||
            extension == '.heic') {
          return selectedImage;
        } else {
          Get.snackbar(
            "Error!",
            "Please select image only",
            backgroundColor: blackColor,
            colorText: whiteColor,
          );
          return null;
        }
      }
    } catch (e) {
      log.e('Error picking image: $e');
      Get.snackbar(
        "Error!",
        "Failed to pick image",
        backgroundColor: blackColor,
        colorText: whiteColor,
      );
      return null;
    }
  }

  // Future<File?> _compressImageFile(File file, String targetPath) async {
  //   debugPrint(
  //       '@compressImageFile => Size before compression: ${await file.length()}');
  //   var result = await FlutterImageCompress.compressAndGetFile(
  //     file.absolute.path,
  //     targetPath,
  //     quality: 70,
  //   );

  //   if (result != null) {
  //     print('File compressed successfully');
  //   } else {
  //     print('Compressed file path is null');
  //   }

  //   debugPrint(
  //       '@compressImageFile => Size after compression: ${await result?.length()}');
  //   return result;
  // }
}
