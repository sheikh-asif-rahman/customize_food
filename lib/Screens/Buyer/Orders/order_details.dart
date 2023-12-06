import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customize_food/Hidden_Drawers/hidden_drawer_buyer.dart';
import 'package:customize_food/Hidden_Drawers/hidden_drawer_seller.dart';
import 'package:customize_food/utils/showSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  var products;
  OrderDetail(this.products);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  //after receiving order, it will delete it from DB and send it to history DB part
  received() async {
    //buyer to seller mail delete
    await FirebaseFirestore.instance
        .collection("buyer-to-seller-mail")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("seller-mail")
        .doc()
        .delete();
    //buyer normal oder data delete
    await FirebaseFirestore.instance
        .collection("buyer-normal-order")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("order-item")
        .doc(widget.products["seller_mail"].toString())
        .collection(widget.products["food_name"].toString())
        .doc(widget.products["food_name"].toString())
        .delete();

    //normal order notification delete
    await FirebaseFirestore.instance
        .collection("normal-order-notification")
        .doc(widget.products["seller_mail"].toString())
        .collection("order")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .delete()
        .then((value) => {
              showSnckBar(context, "Order Received!!"),
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => HiddenDrawerBuyer()))
            });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 68, 79, 83),
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //code for top side image of food//
            //=================================================//
            //==================================================//
            //image part
            Center(
              child: Container(
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Image.network(widget.products["image_url"]),
                height: 300,
                // width: 300,
              ),
            ),
            //=================================================//
            //==================================================//
            //name of the food
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Name: ${widget.products["food_name"]}",
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            //price of the food
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
              ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Total Cost: ${widget.products["total_cost"]} TK",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white60),
              ),
            ),
            //total item number
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
              ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Total Item: ${widget.products["total_item"]}",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white60),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(30),
              padding: EdgeInsets.all(10),
              width: size.width,
              height: 70,
              child: widget.products["is_order_ready"] == false
                  ? ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.deepOrange;
                            }
                            return Colors.blue;
                          },
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'PENDING',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.deepOrange;
                            }
                            return Colors.blue;
                          },
                        ),
                      ),
                      onPressed: () {
                        received();
                      },
                      child: const Text(
                        'RECEIVE',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
