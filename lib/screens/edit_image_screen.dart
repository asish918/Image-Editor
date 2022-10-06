import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_editor/widgets/edit_image_view_model.dart';

import '../widgets/image_text.dart';

class EditImageScreen extends StatefulWidget {
  final String selectedImage;
  const EditImageScreen({Key? key, required this.selectedImage})
      : super(key: key);

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends EditImageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Stack(
            children: [
              _selectedImage,
              for (int i = 0; i < texts.length; i++)
                Positioned(
                    left: texts[i].left,
                    right: texts[i].right,
                    top: texts[i].top,
                    child: GestureDetector(
                      onLongPress: () => debugPrint("Long Pressed!!"),
                      onTap: () => debugPrint("Tapped!!"),
                      child: Draggable(
                        feedback: ImageText(textInfo: texts[i]),
                        child: ImageText(
                          textInfo: texts[i],
                        ),
                        onDragEnd: (drag) {
                          final renderBox =
                              context.findRenderObject() as RenderBox;
                          Offset off = renderBox.globalToLocal(drag.offset);
                          setState(() {
                            texts[i].top = off.dy;
                            texts[i].left = off.dx;
                          });
                        },
                      ),
                    ),),
              creatorText.text.isNotEmpty
                  ? Positioned(
                      left: 0,
                      bottom: 0,
                      child: Text(
                        creatorText.text,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ))
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: _addNewTextFab,
    );
  }

  Widget get _selectedImage => Center(
        child: Image.file(
          File(widget.selectedImage),
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
      );

  AppBar get _appBar => AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                tooltip: "Increase Font Size",
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
                tooltip: "Decrease Font Size",
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.format_align_left,
                  color: Colors.black,
                ),
                tooltip: "Align Left",
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.format_align_center,
                  color: Colors.black,
                ),
                tooltip: "Align Center",
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.format_align_right,
                  color: Colors.black,
                ),
                tooltip: "Align Right",
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.save,
                  color: Colors.black,
                ),
                tooltip: "Save Image",
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.format_bold,
                  color: Colors.black,
                ),
                tooltip: "Bold",
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.format_italic,
                  color: Colors.black,
                ),
                tooltip: "Italic",
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.space_bar,
                  color: Colors.black,
                ),
                tooltip: "Add New Line",
              ),
              Tooltip(
                message: "Red",
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: "White",
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: "Black",
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: "Blue",
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: "Yellow",
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: "Green",
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: "Orange",
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Tooltip(
                message: "Pink",
                child: GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Colors.pink,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      );

  Widget get _addNewTextFab => FloatingActionButton(
        onPressed: () => addNewDialog(context),
        backgroundColor: Colors.white,
        tooltip: 'Add New Text',
        child: const Icon(
          Icons.edit,
          color: Colors.black,
        ),
      );
}
