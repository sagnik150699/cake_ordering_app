import 'package:flutter/material.dart';
import '/components.dart';

class FilterButtonView extends StatelessWidget {
  final title;
  final onPressed;
  const FilterButtonView(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        highlightColor: Colors.pinkAccent.shade100,
        color: Colors.amber,
        onPressed: onPressed,
        child: OpenSans(
          text: title,
          size: 15.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
