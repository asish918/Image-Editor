import 'package:flutter/material.dart';
import 'package:image_editor/screens/edit_image_screen.dart';
import 'package:image_editor/widgets/default_button.dart';

abstract class EditImageViewModel extends State<EditImageScreen> {

  TextEditingController textEditingController = TextEditingController();

  addNewText(BuildContext context) {
    setState(() {

    });
  }

  addNewDialog(context) {
    showDialog(context: context, builder: (BuildContext context) => AlertDialog(
      title: const Text("Add new text"),
      content: TextField(
        controller: textEditingController,
        maxLines: 5,
        decoration: InputDecoration(
          suffixIcon:  Icon(Icons.edit),
          filled: true,
          hintText: "Your funny text here"
        ),
      ),
      actions: [
        DefaultButton(onPressed: () => Navigator.of(context).pop(), color: Colors.black, textColor: Colors.white, child: const Text("Back")),
        DefaultButton(onPressed: () {}, color: Colors.red, textColor: Colors.white, child: const Text("Add Text")),
      ],
    ),);
}
}