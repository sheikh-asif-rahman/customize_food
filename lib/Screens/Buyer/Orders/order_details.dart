import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 15,
          title: const Text(
            "Order Detail",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          //go back from this page button------------------>//
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.deepOrange,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ),
          ),
          //---------------------------------------------------//
        ),
        body: const SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            )));
  }
}