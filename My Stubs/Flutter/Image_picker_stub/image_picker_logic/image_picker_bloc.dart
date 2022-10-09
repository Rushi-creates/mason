import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerInitial()) {
    final ImagePicker _picker = ImagePicker();

/* -------------------------------------------------------------------------- */
/*                     //! Pick single image from gallery                     */
/* -------------------------------------------------------------------------- */

    on<PickGallery_SingleImage_Event>((event, emit) async {
      // Pick an image

      try {
        final XFile? image =
            await _picker.pickImage(source: ImageSource.gallery);

        if (image == null) {
          emit(SingleGalleryImage_noImagePicked_state());
        } else {
          File? pickedImage = File(image.path);
          // String store_imgText = basename(pickedImage!.path);
          emit(SingleGalleryImage_picked_state(
            pickedImage,
            // store_imgText
          ));
        }
      } on PlatformException catch (e) {
        print("Failed to pick image $e");
        emit(SingleGalleryImage_pickingError_state());
      }
    });

/* -------------------------------------------------------------------------- */
/*                    //! capture single image from camera                    */
/* -------------------------------------------------------------------------- */

    on<CaptureCamera_singleImage_Event>((event, emit) async {
      try {
        final XFile? image =
            await _picker.pickImage(source: ImageSource.camera);

        if (image == null) {
          emit(SingleCameraImage_noImagePicked_state());
        } else {
          File? pickedImage = File(image.path);

          emit(SingleCameraImage_picked_state(pickedImage));
        }
      } on PlatformException catch (e) {
        print("Failed to pick image $e");
        emit(SingleCameraImage_pickingError_state());
      }
    });
  }
}
