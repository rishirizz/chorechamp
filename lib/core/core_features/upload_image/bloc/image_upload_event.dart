part of 'image_upload_bloc.dart';

class ImageUploadEvent extends Equatable {
  const ImageUploadEvent();

  @override
  List<Object> get props => [];
}

class PickImageFileEvent extends ImageUploadEvent {}

