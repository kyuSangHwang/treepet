import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  final XFile image;
  final VoidCallback onNewImagePressed;

  const CustomImagePicker({Key? key, required this.image, required this.onNewImagePressed}) : super(key: key);

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
