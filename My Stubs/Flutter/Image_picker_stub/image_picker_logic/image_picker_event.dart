part of 'image_picker_bloc.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}

class PickGallery_SingleImage_Event extends ImagePickerEvent {}

class CaptureCamera_singleImage_Event extends ImagePickerEvent {}
