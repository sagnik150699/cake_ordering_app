import 'package:flutter/material.dart';
import '/components.dart';
import '/menu_view/car_cake_stack_view.dart';
import '/menu_view/drawer_view.dart';
import '/menu_view/filter_button_view.dart';
import '/menu_view/list_cakes.dart';
import '/menu_view/new_and_best_seller_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../view_model.dart';

class MenuView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double categoryHeight = MediaQuery.of(context).size.height;
    final viewModelProvider = ref.watch(viewModel);
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    Logger logger = Logger();
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
    List<Widget> vanillaFlavours = [
      SizedBox(width: 60),
      CakeCardStack(
          colourBg1: Color(0xffF082AC),
          colourBg2: Color(0xff90A8E8),
          imagePath: 'assets/1.png',
          title: "Vanilla Cheese Cake",
          price: 1.75,
          imgHeight: 160.0,
          imgWidth: 150.0),
      SizedBox(width: 10),
      CakeCardStack(
          colourBg1: Color(0xFFE0BD81),
          colourBg2: Colors.amber.shade700,
          imagePath: "assets/4.png",
          title: "Vanilla Frosted Peanut",
          price: 1.7,
          imgHeight: 150.0,
          imgWidth: 150.0),
      SizedBox(width: 10),
      CakeCardStack(
          colourBg1: Colors.brown.shade500,
          colourBg2: Color(0xffFFD897),
          imagePath: "assets/7.png",
          title: "Vanilla berry",
          price: 1.7,
          imgHeight: 150.0,
          imgWidth: 180.0),
      SizedBox(width: 10),
    ];
    List<Widget> chocolateFlavours = [
      SizedBox(width: 60),
      //First Stack
      CakeCardStack(
          colourBg1: Color(0xffF082AC),
          colourBg2: Color(0xff90A8E8),
          imagePath: 'assets/6.png',
          title: "Chocolate Brownie cream",
          price: 1.75,
          imgHeight: 160.0,
          imgWidth: 150.0),

      const SizedBox(width: 10),
      CakeCardStack(
          colourBg1: Color(0xFFE0BD81),
          colourBg2: Colors.amber.shade700,
          imagePath: "assets/2.png",
          title: "Chocolate Cake",
          price: 1.7,
          imgHeight: 150.0,
          imgWidth: 150.0),
      SizedBox(width: 10),
      CakeCardStack(
          colourBg1: Colors.brown.shade500,
          colourBg2: Color(0xffFFD897),
          imagePath: "assets/3.png",
          title: "Chocolate Ice cream",
          price: 1.7,
          imgHeight: 150.0,
          imgWidth: 180.0),
      SizedBox(width: 10),
    ];
    Widget hiName() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  _key.currentState!.openDrawer();
                },
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.table_rows_sharp,
                  size: 30.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: FutureBuilder(
                  future: viewModelProvider.currentUserDetail(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.data != null) {
                      return SizedBox(
                        width: 200.0,
                        child: Text(
                          "Hi ${snapshot.data.toString()}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      );
                    } else
                      return OpenSans(text: "Hi", size: 20.0);
                  },
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget whatWouldYouLikeToEat() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //What would you
          const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: OpenSans(
                text: "What would you",
                size: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),

          //like to eat
          const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: OpenSans(
                text: "like to eat?",
                size: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        drawer: DrawerMenu(),
        key: _key,
        body: Stack(
          children: [
            //background
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xffE9D5ED),
                    Colors.white,
                    const Color(0xffDBF3FF),
                    Colors.white,
                    const Color(0xffE9D5ED),
                  ],
                ),
              ),
            ),
            Container(
              height: categoryHeight,
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.0),
                      hiName(),
                      whatWouldYouLikeToEat(),
                      SizedBox(height: 30.0),
                      Container(
                        height: 330.0,
                        child: Stack(
                          children: [
                            //Side Menu
                            ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Row(
                                  children: viewModelProvider
                                              .filterViewNumber ==
                                          1
                                      ? allFlavours
                                      : viewModelProvider.filterViewNumber == 2
                                          ? chocolateFlavours
                                          : vanillaFlavours,
                                )
                              ],
                            ),
                            //Side menu filters
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                ),
                                color: Color(0xFFE5E8F2),
                              ),
                              width: 50.0,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FilterButtonView(
                                    title: "All Flavours",
                                    onPressed: () {
                                      viewModelProvider.changeFilterView(1);
                                    },
                                  ),
                                  FilterButtonView(
                                    title: "Chocolate",
                                    onPressed: () {
                                      viewModelProvider.changeFilterView(2);
                                    },
                                  ),
                                  FilterButtonView(
                                    title: "Vanilla",
                                    onPressed: () {
                                      viewModelProvider.changeFilterView(3);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: OpenSans(
                            text: "Explore from categories",
                            size: 25.0,
                            color: Colors.black),
                      ),
                      SizedBox(height: 20.0),

                      //New this week && Best seller section
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        height: 190.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            NewAndBestSellerView(
                              bgColor1: Color(0xffF6C9FF),
                              bgColor2: Colors.red.shade100,
                              imgHeight: 130.0,
                              imgWidth: 180.0,
                              imgPath: "assets/3.png",
                              text: "New this week",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ListCakes()));
                              },
                            ),
                            SizedBox(width: 20.0),
                            NewAndBestSellerView(
                              bgColor1: Color(0xFFB3F4DD),
                              bgColor2: Colors.tealAccent.shade700,
                              imgHeight: 130.0,
                              imgWidth: 150.0,
                              imgPath: "assets/2.png",
                              text: "Best Seller",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ListCakes()));
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
