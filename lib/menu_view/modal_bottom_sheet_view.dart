import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components.dart';
import '../view_model.dart';

class ModalBottomSheetWidget extends HookConsumerWidget {
  final cakeName;
  final double cakeInitialPrice;
  ModalBottomSheetWidget(
      {required this.cakeName, required this.cakeInitialPrice});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelProvider = ref.watch(viewModel);
    String calculatePrice(price) {
      final priceCake = price * viewModelProvider.cakeSize;
      return priceCake.toString();
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      height: 270.0,
      padding: EdgeInsets.symmetric(horizontal: 13.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 30.0),
          Divider(color: Colors.pinkAccent),
          //Name of Cake
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OpenSans(
                text: "Cake name",
                size: 12.0,
                color: Colors.black,
              ),
              OpenSans(
                text: cakeName,
                size: 12.0,
                color: Colors.black,
              ),
            ],
          ),
          Divider(color: Colors.pinkAccent),

          //Choose Size
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OpenSans(
                text: "Choose Size:",
                size: 12.0,
                color: Colors.black,
              ),
              Row(
                children: [
                  MaterialButton(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    minWidth: 60.0,
                    onPressed: () {
                      viewModelProvider.toggleCakeSize(1);
                    },
                    child: OpenSans(
                      text: "S",
                      size: 12.0,
                      color: Colors.black,
                    ),
                    color: viewModelProvider.cakeSize == 1
                        ? Colors.pinkAccent
                        : Colors.amber,
                  ),
                  SizedBox(width: 5.0),
                  MaterialButton(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    minWidth: 60.0,
                    onPressed: () {
                      viewModelProvider.toggleCakeSize(2);
                    },
                    child: OpenSans(
                      text: "M",
                      size: 12.0,
                      color: Colors.black,
                    ),
                    color: viewModelProvider.cakeSize == 2
                        ? Colors.pinkAccent
                        : Colors.amber,
                  ),
                  SizedBox(width: 5.0),
                  MaterialButton(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    minWidth: 60.0,
                    onPressed: () {
                      viewModelProvider.toggleCakeSize(3);
                    },
                    child: OpenSans(
                      text: "L",
                      size: 12.0,
                      color: Colors.black,
                    ),
                    color: viewModelProvider.cakeSize == 3
                        ? Colors.pinkAccent
                        : Colors.amber,
                  ),
                ],
              )
            ],
          ),
          Divider(color: Colors.pinkAccent),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OpenSans(
                text: "Cake price",
                size: 12.0,
                color: Colors.black,
              ),
              OpenSans(
                text: "\$ ${calculatePrice(cakeInitialPrice)}",
                size: 12.0,
                color: Colors.black,
              ),
            ],
          ),
          //proceed to pay
          MaterialButton(
            onPressed: () async {
              await viewModelProvider.orderCake(cakeName,
                  viewModelProvider.cakeSize, calculatePrice(cakeInitialPrice));
              Navigator.pop(context);
            },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            height: 50.0,
            minWidth: 100.0,
            color: Colors.pinkAccent,
            child: OpenSans(
                text: "Proceed to pay",
                size: 13.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
