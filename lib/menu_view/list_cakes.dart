import 'package:flutter/material.dart';

import 'car_cake_stack_view.dart';

class ListCakes extends StatefulWidget {
  const ListCakes({Key? key}) : super(key: key);
  _ListCakesState createState() => _ListCakesState();
}

class _ListCakesState extends State<ListCakes> {
  @override
  Widget build(BuildContext context) {
    List<Widget> allFlavours = [
      SizedBox(width: 60),
      //First Stack
      CakeCardStack(
          colourBg1: Color(0xFFE0BD81),
          colourBg2: Colors.amber.shade700,
          imagePath: "assets/4.png",
          title: "Vanilla Frosted Peanut",
          price: 1.7,
          imgHeight: 150.0,
          imgWidth: 150.0),
      SizedBox(
        width: 10,
      ),
      CakeCardStack(
          colourBg1: Colors.brown.shade500,
          colourBg2: Color(0xffFFD897),
          imagePath: "assets/7.png",
          title: "Vanilla berry",
          price: 1.7,
          imgHeight: 150.0,
          imgWidth: 180.0),
      SizedBox(
        width: 10,
      ),
      CakeCardStack(
          colourBg1: Color(0xffF082AC),
          colourBg2: Color(0xff90A8E8),
          imagePath: 'assets/6.png',
          title: "Chocolate brownie cream",
          price: 1.75,
          imgHeight: 160.0,
          imgWidth: 150.0),

      SizedBox(
        width: 10,
      ),
      CakeCardStack(
          colourBg1: Color(0xFFE0BD81),
          colourBg2: Colors.amber.shade700,
          imagePath: "assets/2.png",
          title: "Strawberry Frosted Peanut",
          price: 1.7,
          imgHeight: 150.0,
          imgWidth: 150.0),
      SizedBox(
        width: 10,
      ),
      CakeCardStack(
          colourBg1: Colors.brown.shade500,
          colourBg2: Color(0xffFFD897),
          imagePath: "assets/3.png",
          title: "Strawberry Frosted Peanut",
          price: 1.7,
          imgHeight: 150.0,
          imgWidth: 180.0),
      SizedBox(
        width: 10,
      ),
      CakeCardStack(
          colourBg1: Color(0xffF082AC),
          colourBg2: Color(0xff90A8E8),
          imagePath: 'assets/1.png',
          title: "Vanilla Cheese Cake",
          price: 1.75,
          imgHeight: 160.0,
          imgWidth: 150.0),

      SizedBox(
        width: 10,
      ),
    ];
    return Scaffold(
        appBar: AppBar(),
        body: ListView(children: [Column(children: allFlavours)]));
  }
}
