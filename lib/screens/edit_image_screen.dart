import 'dart:io';

import 'package:flutter/material.dart';
class EditImageScreen extends StatefulWidget {
  final String selectedImage;
  const EditImageScreen({Key? key, required this.selectedImage}) : super(key: key);

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(File(widget.selectedImage),height: 250, width: double.maxFinite, fit: BoxFit.cover,),
    );
  }
}
