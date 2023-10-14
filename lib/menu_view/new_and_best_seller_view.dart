import 'package:flutter/material.dart';
import '/components.dart';

class NewAndBestSellerView extends StatelessWidget {
  final bgColor1;
  final bgColor2;
  final imgHeight;
  final imgWidth;
  final imgPath;
  final text;
  final onPressed;
  const NewAndBestSellerView(
      {Key? key,
      required this.bgColor1,
      required this.bgColor2,
      required this.imgHeight,
      required this.imgWidth,
      required this.imgPath,
      required this.text,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [bgColor1, bgColor2],
            ),
          ),
          width: 180.0,
        ),
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 180.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                    height: imgHeight,
                    width: imgWidth,
                    image: AssetImage(imgPath)),
                OpenSans(
                  text: text,
                  size: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
