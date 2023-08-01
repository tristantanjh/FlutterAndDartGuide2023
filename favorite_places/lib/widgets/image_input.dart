import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput(this.onSelectImage, {super.key});

  final void Function(File image) onSelectImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? selectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();

    final chosenImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (chosenImage == null) {
      return;
    }

    setState(() {
      // convert xfile to file
      selectedImage = File(chosenImage.path);
    });

    widget.onSelectImage(selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      icon: const Icon(Icons.camera),
      label: const Text('Take Picture'),
      onPressed: _takePicture,
    );

    if (selectedImage != null) {
      // gesturedetector allows for replacing picture ontap
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ),
      ),
      height: 250,
      width: double.infinity,
      child: content,
    );
  }
}
