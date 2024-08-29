part of 'image_upload_bloc.dart';

class ImageUploadState extends Equatable {
  const ImageUploadState({
    required this.imageUploadStatus,
    required this.imageFile,
    required this.base64Image,
  });

  final ImageUploadStatus imageUploadStatus;
  final File imageFile;
  final String base64Image;

  factory ImageUploadState.initial() {
    return ImageUploadState(
      imageUploadStatus: ImageUploadStatus.initial,
      imageFile: File(''),
      base64Image: '',
    );
  }

  ImageUploadState copyWith({
    ImageUploadStatus? imageUploadStatus,
    String? imagePath,
    File? imageFile,
    String? base64Image,
  }) {
    return ImageUploadState(
      imageUploadStatus: imageUploadStatus ?? this.imageUploadStatus,
      imageFile: imageFile ?? this.imageFile,
      base64Image: base64Image ?? this.base64Image,
    );
  }

  @override
  List<Object> get props => [
        imageUploadStatus,
        imageFile,
        base64Image,
      ];
}
