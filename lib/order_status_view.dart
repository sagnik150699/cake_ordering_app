import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/models.dart';

import 'components.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Order Status",
            style: TextStyle(fontSize: 17.0, color: Colors.white),
          ),
          backgroundColor: Colors.pinkAccent.shade400,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('orders')
                .where('userID',
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: OpenSans(
                        text: "You don't have any orders",
                        size: 16.0,
                        color: Colors.black));
              } else {
                List<OrderStatusModel> orders = [];
                snapshot.data.docs.forEach((element) {
                  orders.add(OrderStatusModel.fromJson(element.data()));
                });

                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return OrderStatusTile(
                      documentID: orders[index].documentID,
                      status: orders[index].status,
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}

class OrderStatusTile extends StatelessWidget {
  final documentID;
  final status;

  const OrderStatusTile(
      {Key? key, required this.documentID, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 3.0, color: Colors.pinkAccent)],
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order Id:",
                  style: TextStyle(fontSize: 17.0, color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  documentID.toString(),
                  style: TextStyle(fontSize: 13.0, color: Colors.white),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Status: ${status == 1 ? "Order Received" : status == 2 ? "Preparing" : status == 3 ? "Out for delivery" : "Delivered"}",
                  style: TextStyle(fontSize: 17.0, color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 170.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: status >= 1 ? Colors.green : Colors.white,
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: status >= 2 ? Colors.green : Colors.white,
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: status >= 3 ? Colors.green : Colors.white,
                        ),
                      ),
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: status >= 4 ? Colors.green : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
