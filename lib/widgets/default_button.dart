import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final Color textColor;
  const DefaultButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      required this.color,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        textStyle: MaterialStateProperty.all(
          TextStyle(color: textColor),
        ),
      ),
      child: child,
    );
  }
}
