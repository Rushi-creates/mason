part of 'image_picker_bloc.dart';

abstract class ImagePickerState extends Equatable {
  const ImagePickerState();

  @override
  List<Object> get props => [];
}

class ImagePickerInitial extends ImagePickerState {}

class SingleGalleryImage_picked_state extends ImagePickerState {
  final pickedImage;
  // String pickedImage_text = 'no value';

  SingleGalleryImage_picked_state(
    this.pickedImage,
    //  this.pickedImage_text
  );

  @override
  List<Object> get props => [
        pickedImage,
        //  pickedImage_text
      ];
}

class SingleGalleryImage_noImagePicked_state extends ImagePickerState {}

class SingleGalleryImage_pickingError_state extends ImagePickerState {}

class SingleCameraImage_picked_state extends ImagePickerState {
  final capturedImage;

  SingleCameraImage_picked_state(this.capturedImage);

  @override
  List<Object> get props => [capturedImage];
}

class SingleCameraImage_noImagePicked_state extends ImagePickerState {}

class SingleCameraImage_pickingError_state extends ImagePickerState {}
