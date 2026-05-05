import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/image_picker/image_picker_bloc.dart';
import '../../bloc/image_picker/image_picker_event.dart';
import '../../bloc/image_picker/image_picker_state.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Picker Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<ImagePickerBloc, ImagePickerState>(
            buildWhen: (previous, current) => previous.file != current.file,
            builder: (context, state) {
              if (state.file == null) {
                return CircleAvatar(
                  radius: 120,
                  child: Icon(Icons.person_pin, size: 100,),
                );
              } else {
                return Image.file(
                  File(state.file!.path.toString()),
                );
              }
            },
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  context.read<ImagePickerBloc>().add(CameraCapture());
                },
                child: CircleAvatar(
                  child: Icon(Icons.camera_alt_outlined),
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () {
                  context.read<ImagePickerBloc>().add(GalleryImageCapture());
                },
                child: CircleAvatar(
                  child: Icon(Icons.photo),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
