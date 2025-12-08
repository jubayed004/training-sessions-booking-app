import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TrainerInformationController extends GetxController {
  final RxList<File> selectedImages = <File>[].obs; // Store selected images
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImagesFromGallery(BuildContext context) async {
    if (selectedImages.length < 3) {
      final List<XFile>? images = await _picker.pickMultiImage();
      if (images != null) {
        for (var image in images) {
          if (selectedImages.length < 3) {
            selectedImages.add(File(image.path)); // Add image to list
          }
        }
      }
    } else {
      // Show a message if 3 images are already selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(

          content: Text('You can only select a maximum of 3 images.'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red, // You can customize the Snackbar style
        ),
      );
    }
  }

  // Remove an image from the list
  void removeImage(File image) {
    selectedImages.remove(image); // Remove image from list
  }
}

/*

  ///=========================> Pick an image using the camera <======================///
  Future<void> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      selectedImage.value = File(image.path);
    }
  }
*/

