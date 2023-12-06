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
            "order_pending_status": qnProducts.docs[0]["order_pending_status"],
            "is_order_ready": qnProducts.docs[0]["is_order_ready"],
            "seller_mail": qnProducts.docs[0]["seller_mail"],
            "buyer_mail": qnProducts.docs[0]["buyer_mail"],
          });
        });
      }
    }
    //printing just for debuging here
    print(itemName);
    print(sellermails);
    print(orderList);
  }

  @override
  void initState() {
    fetchOderList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 79, 83),
      body: SafeArea(
        //for list type page of order list//
        child: ListView.builder(
            itemCount: orderList.length,
            itemBuilder: (_, index) {
              //click page route code//
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => OrderDetail(orderList[index])));
                },
                //card detail code//
                child: Card(
                  color: Colors.white60,
                  elevation: 10,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(1),
                      child: Image.network(orderList[index]["image_url"]),
                    ),
                    title: Center(
                      child: Text(
                        orderList[index]["food_name"],
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Container(
                      padding:
                          const EdgeInsets.only(left: 30, top: 5, bottom: 10),
                      child: Row(
                        children: [
                          const Text(
                            "Total Cost ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            orderList[index]["total_cost"].toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            " TK",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    trailing: SizedBox(
                        //pending for faulse
                        //done for true
                        child: orderList[index]["is_order_ready"] == false
                            ? Container(
                                padding: const EdgeInsets.all(7),
                                margin: const EdgeInsets.all(5),
                                height: 50,
                                width: 90,
                                color: Colors.yellow,
                                child: const Text(
                                  "Pending",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                margin: const EdgeInsets.all(5),
                                height: 50,
                                width: 90,
                                color: Colors.greenAccent,
                                child: const Text(
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
