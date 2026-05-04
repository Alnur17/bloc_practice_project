import 'package:bloc/bloc.dart';
import 'package:block_practice_project/bloc/image_picker/image_picker_event.dart';
import 'package:block_practice_project/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {

  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImageCapture>(_galleryImageCapture);
  }

  void _cameraCapture(CameraCapture event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.pickImageFromCamera();
    emit(state.copyWith(file: file));
  }

  void _galleryImageCapture(GalleryImageCapture event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }


}