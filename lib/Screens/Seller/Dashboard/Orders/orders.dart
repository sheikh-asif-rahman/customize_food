import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customize_food/Screens/Seller/Dashboard/Orders/seller_order_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class orderListSeller extends StatefulWidget {
  var data;
  orderListSeller(this.data);
  @override
  State<orderListSeller> createState() => _orderListSellerState();
}

class _orderListSellerState extends State<orderListSeller> {
  //order list store here
  List orderList = [];
  //buyer normal order --- buyer mail --- order item --- seller mail --- food name --- items etc
  //fetch data of the order list
  fetchOderList() async {
    //get total number of document length
    QuerySnapshot qnmail = await FirebaseFirestore.instance
        .collection("normal-order-notification")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("order")
        .get();
    //use this length for data store in array
    for (int i = 0; i < qnmail.docs.length; i++) {
      QuerySnapshot qnProducts = await FirebaseFirestore.instance
          .collection("buyer-normal-order")
          .doc(widget.data[i]["buyer_mail"].toString())
          .collection("order-item")
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection(widget.data[i]["food_name"].toString())
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
          "seller_mail": qnProducts.docs[0]["seller_mail"],
          "buyer_mail": qnProducts.docs[0]["buyer_mail"],
          //this is for buyer status
          "order_pending_status": qnProducts.docs[0]["order_pending_status"],
          //this is for seller status
          "is_order_ready": qnProducts.docs[0]["is_order_ready"]
        });
      });
    }
  }

  @override
  void initState() {
    fetchOderList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 15,
        title: const Text(
          "Order List",
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
                          builder: (_) => SellerOrderDetail(orderList[index])));
                },
                //card detail code//
                child: Card(
                  color: Colors.white60,
                  elevation: 10,
                  child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(orderList[index]["image_url"]),
                      ),
                      title: Center(
                        child: Text(
                          orderList[index]["food_name"],
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Center(
                        child: Text(
                          orderList[index]["food_code"],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      trailing: Column(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 10,
                            child: Text(
                              orderList[index]["total_item"].toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            child: Text("Total order"),
                          ),
                        ],
                      )),
                ),
              );
            }),
      ),
    );
    ;
  }
}
