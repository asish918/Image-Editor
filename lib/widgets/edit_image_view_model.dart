import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_editor/screens/edit_image_screen.dart';
import 'package:image_editor/widgets/default_button.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import '../models/text_info.dart';
import '../utils/utils.dart';

abstract class EditImageViewModel extends State<EditImageScreen> {
  List<TextInfo> texts = [];
  int currentIndex = 0;

  saveToGallery(BuildContext context) {
    if (texts.isNotEmpty)
      screenshotController
          .capture()
          .then((Uint8List? image) {
            saveImage(image!);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Image saved to gallery",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            );
      })
          .catchError((err) => debugPrint(err));
  }

  saveImage(Uint8List bytes) async {
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll(".", "-")
        .replaceAll(":", "-");
    final name = "Screenshot_$time";
    await requestPermission(Permission.storage);
    await ImageGallerySaver.saveImage(bytes, name: name);
  }

  removeText(BuildContext context) {
    setState(() {
      texts.removeAt(currentIndex);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Deleted",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  setCurrentIndex(BuildContext context, index) {
    setState(() {
      currentIndex = index;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Selected For Styling",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  changeTextColor(Color color) {
    setState(() {
      texts[currentIndex].color = color;
    });
  }

  increaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize += 2;
    });
  }

  decreaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize -= 2;
    });
  }

  alignLeft() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.left;
    });
  }

  alignRight() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.right;
    });
  }

  alignCenter() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.center;
    });
  }

  boldText() {
    setState(() {
      if (texts[currentIndex].fontWeight == FontWeight.bold)
        texts[currentIndex].fontWeight = FontWeight.normal;
      else
        texts[currentIndex].fontWeight = FontWeight.bold;
    });
  }

  italicText() {
    setState(() {
      if (texts[currentIndex].fontStyle == FontStyle.italic)
        texts[currentIndex].fontStyle = FontStyle.normal;
      else
        texts[currentIndex].fontStyle = FontStyle.italic;
    });
  }

  addLinesToText() {
    setState(() {
      if (texts[currentIndex].text.contains("\n"))
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll("\n", " ");
      else
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll(" ", "\n");
    });
  }

  TextEditingController textEditingController = TextEditingController();
  TextEditingController creatorText = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();

  addNewText(BuildContext context) {
    setState(() {
      texts.add(TextInfo(textEditingController.text, 0, 0, 0, Colors.black,
          FontWeight.normal, FontStyle.normal, 20, TextAlign.left));
      Navigator.of(context).pop();
    });
  }

  addNewDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Add new text"),
        content: TextField(
          controller: textEditingController,
          maxLines: 5,
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.edit),
              filled: true,
              hintText: "Your funny text here"),
        ),
        actions: [
          DefaultButton(
              onPressed: () => Navigator.of(context).pop(),
              color: Colors.black,
              textColor: Colors.white,
              child: const Text("Back")),
          DefaultButton(
              onPressed: () => addNewText(context),
              color: Colors.red,
              textColor: Colors.white,
              child: const Text("Add Text")),
        ],
      ),
    );
  }
}
