import 'package:flutter/material.dart';
import 'order_details.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 68, 79, 83),
      body: SafeArea(
        //for list type page of order list//
        child: ListView.builder(
            itemCount: 15,
            itemBuilder: (_, index) {
              //click page route code//
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => OrderDetail()));
                },
                //card detail code//
                child: Card(
                  color: Colors.white60,
                  elevation: 10,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("image/burger.jpg"),
                    ),
                    title: const Center(
                      child: Text(
                        "Burger",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: const Center(
                      child: Text(
                        "Shop Name",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    trailing: CircleAvatar(
                        child: IconButton(
                          icon: const Icon(Icons.map_rounded),
                          onPressed: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => MapTracking(),
                            //   ),
                            // );
                          },
                        )),
                  ),
                ),
              );
            }),
      ),
    );
  }
}