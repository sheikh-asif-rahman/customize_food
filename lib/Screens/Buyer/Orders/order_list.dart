import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'order_details.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  var orderReadyYes = "Done";
  var orderReadyNo = "Pending";
  var pending = 0;
  List orderList = [];
  List sellermails = [];
  List itemName = [];
  //fetch order data from db
  fetchOderList() async {
    //getting seller mail and food name
    QuerySnapshot qnMailOfSeller = await FirebaseFirestore.instance
        .collection("buyer-to-seller-mail")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("seller-mail")
        .get();
    for (int i = 0; i < qnMailOfSeller.docs.length; i++) {
      setState(() {
        sellermails.add({"seller_mail": qnMailOfSeller.docs[i]["seller_mail"]});
        itemName.add({"product_name": qnMailOfSeller.docs[i]["product_name"]});
      });
      //=====================================================================//

      // use this length for data store in array
      for (int i = 0; i < sellermails.length; i++) {
        QuerySnapshot qnProducts = await FirebaseFirestore.instance
            .collection("buyer-normal-order")
            .doc(FirebaseAuth.instance.currentUser!.email)
            .collection("order-item")
            .doc(sellermails[i]["seller_mail"].toString())
            .collection(itemName[i]["product_name"].toString())
            .get();
        setState(() {
          orderList.add({
            //for each buyer, in one seller shop, one order is here, so array onlu zero here
            "food_name": qnProducts.docs[0]["food_name"],
            "food_code": qnProducts.docs[0]["food_code"],
            "food_description": qnProducts.docs[0]["food_description"],
            "image_url": qnProducts.docs[0]["image_url"],
            "food_price": qnProducts.docs[0]["food_price"],
            "total_item": qnProducts.docs[0]["total_item"],
            "total_cost": qnProducts.docs[0]["total_cost"],
          });
        });
      }
    }
    print(itemName);
    print(orderList);
  }

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
                  fetchOderList();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (_) =>
                  //     OrderDetail()
                  //     ));
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
                    trailing: SizedBox(
                        child: pending != 1
                            ? Container(
                                padding: EdgeInsets.all(7),
                                margin: EdgeInsets.all(5),
                                height: 50,
                                width: 90,
                                color: Colors.yellow,
                                child: Text(
                                  "Pending",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                margin: EdgeInsets.all(5),
                                height: 50,
                                width: 90,
                                color: Colors.greenAccent,
                                child: Text(
                                  "Done",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
