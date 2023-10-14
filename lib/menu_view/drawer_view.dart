import 'package:flutter/material.dart';

import '/components.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../order_status_view.dart';
import '../view_model.dart';

class DrawerMenu extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelProvider = ref.watch(viewModel);

    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/chocolate-cake.png", width: 310.0),
          ),
          SizedBox(height: 40.0),
          MaterialButton(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            height: 50.0,
            minWidth: 250.0,
            color: Colors.amber,
            child: OpenSans(text: "Orders", size: 20.0, color: Colors.black),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => OrderStatus()),
              );
            },
          ),
          SizedBox(height: 20.0),
          MaterialButton(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            height: 50.0,
            minWidth: 250.0,
            color: Colors.amber,
            child: OpenSans(
              text: "Logout",
              size: 20.0,
              color: Colors.black,
            ),
            onPressed: () async {
              await viewModelProvider.logout();
            },
          )
        ],
      ),
    );
  }
}
