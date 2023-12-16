import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class userImagePicker extends StatefulWidget {
  const userImagePicker({super.key, required this.onPickImage});

  final void Function(File PickImage) onPickImage;
  State<userImagePicker> createState() {
    return _UserImagePickerState();
  }
}

class _UserImagePickerState extends State<userImagePicker> {
  File? _pickedImageFile;
  void _pickImage() async {
    final PickedImg = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
      maxWidth: 150,
    );
    if (PickedImg == null) {
      return;
    }
    setState(() {
      _pickedImageFile = File(PickedImg.path);
    });

    widget.onPickImage(_pickedImageFile!);
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.indigo,
          foregroundImage:
              _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
        ),
        TextButton.icon(
            onPressed: _pickImage,
            icon: const Icon(Icons.image),
            label: Text(
              ' Add Your Image ',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ))
      ],
    );
  }
}
