import 'dart:io';

import 'package:chorechamp/core/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core_features/upload_image/bloc/image_upload_bloc.dart';

class UserHeaderWidget extends StatelessWidget {
  const UserHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocListener<ImageUploadBloc, ImageUploadState>(
            listener: (context, state) {
              if (state.imageUploadStatus == ImageUploadStatus.success) {
                SnackBar snackBar = const SnackBar(
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  content: Text('Image Uploaded successfully.'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: BlocBuilder<ImageUploadBloc, ImageUploadState>(
              buildWhen: (previous, current) =>
                  previous.imageFile != current.imageFile,
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    context.read<ImageUploadBloc>().add(PickImageFileEvent());
                  },
                  child: (state.imageUploadStatus == ImageUploadStatus.initial)
                      ? const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 40,
                          child: FlutterLogo(
                            size: 45,
                          ),
                        )
                      : Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: FileImage(
                                state.imageFile,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                );
              },
            ),
          ),
          const Expanded(
            child: ListTile(
              title: Text(
                'Arijeet Chakraborty',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'arijeetc6@gmail.com',
              ),
            ),
          ),
          const Icon(
            Icons.person,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.settings,
            size: 30,
          ),
        ],
      ),
    );
  }
}
