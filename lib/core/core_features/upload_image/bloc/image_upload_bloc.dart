import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../enums/enums.dart';

part 'image_upload_event.dart';
part 'image_upload_state.dart';

class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
  ImageUploadBloc() : super(ImageUploadState.initial()) {
    on<PickImageFileEvent>(_onImageUpload);
  }

  _onImageUpload(
      PickImageFileEvent event, Emitter<ImageUploadState> emit) async {
    try {
      final ImagePicker picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        emit(
          state.copyWith(
            imageFile: File(pickedFile.path),
            imageUploadStatus: ImageUploadStatus.loading,
          ),
        );
        Uint8List imageBytes = await state.imageFile.readAsBytes();
        String base64Image = base64Encode(imageBytes);
        emit(
          state.copyWith(
            imageUploadStatus: ImageUploadStatus.success,
            base64Image: base64Image,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          imageUploadStatus: ImageUploadStatus.failure,
        ),
      );
    }
  }
}
