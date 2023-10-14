import 'package:flutter/material.dart';
import '/components.dart';

import 'modal_bottom_sheet_view.dart';

class CakeCardStack extends StatelessWidget {
  final colourBg1;
  final colourBg2;
  final imagePath;
  final title;
  final price;
  final imgHeight;
  final imgWidth;

  const CakeCardStack({
    Key? key,
    required this.colourBg1,
    required this.colourBg2,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.imgHeight,
    required this.imgWidth,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colourBg1,
                  colourBg2,
                ]),
          ),
          width: 180.0,
        ),
        Container(
          width: 180.0,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  height: imgHeight,
                  width: imgWidth,
                  image: AssetImage(imagePath)),
              SizedBox(height: 40.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OpenSans(
                    text: title.toString(),
                    size: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 5.0),
                  //Price and add button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OpenSans(
                        text: price.toString(),
                        size: 15.0,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                      GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext context) {
                                  return ModalBottomSheetWidget(
                                    cakeName: title,
                                    cakeInitialPrice: price,
                                  );
                                });
                          },
                          child: Icon(Icons.add_box_rounded,
                              color: Colors.white, size: 30.0))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
