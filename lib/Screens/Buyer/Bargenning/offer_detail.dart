import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customize_food/Hidden_Drawers/hidden_drawer_buyer.dart';
import 'package:customize_food/Screens/Buyer/Bargenning/buyer_offer_platform.dart.dart';
import 'package:customize_food/utils/showSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OfferDetail extends StatefulWidget {
  var product;
  OfferDetail(this.product);

  @override
  State<OfferDetail> createState() => _OfferDetailState();
}

class _OfferDetailState extends State<OfferDetail> {
  bool _isLoading = true;
  //place order to sellet datbase
  confirm() async {
    //buyer normal order --- buyer mail --- order item --- seller mail --- food name --- items etc
    await FirebaseFirestore.instance
        .collection("buyer-normal-order")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("order-item")
        .doc(widget.product["seller_mail"].toString())
        .collection(widget.product["food_name"].toString())
        .doc(widget.product["food_name"].toString())
        .set({
      "food_code": widget.product["food_code"].toString(),
      "food_name": widget.product["food_name"].toString(),
      "food_price": widget.product["food_price"].toString(),
      "food_description": widget.product["food_description"].toString(),
      "image_url": widget.product["image_url"].toString(),
      "seller_mail": widget.product["seller_mail"].toString(),
      "buyer_mail": FirebaseAuth.instance.currentUser!.email.toString(),
      "total_item": widget.product["total_item"],
      "total_cost": widget.product["seller_offer"],
      "order_pending_status": false,
      "is_order_ready": false,
    });
    // normal-order-notification --- seller mail --- order item --- buyer mail --- food
    await FirebaseFirestore.instance
        .collection("normal-order-notification")
        .doc(widget.product["seller_mail"].toString())
        .collection("order")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .set({"food_name": widget.product["food_name"].toString()});
    //store seller mail and food name
    await FirebaseFirestore.instance
        .collection("buyer-to-seller-mail")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("seller-mail")
        .doc()
        .set({
      "seller_mail": widget.product["seller_mail"].toString(),
      "product_name": widget.product["food_name"].toString()
    });
    setState(() {
      _isLoading = true;
    });
    showSnckBar(context, "Order Placed !!");
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => HiddenDrawerBuyer()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 15,
        title: const Text(
          "Seller Offer To You",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        //go back from this page button------------------>//
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.blue[900],
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            //image of the food
            Center(
                child: Container(
                    margin: EdgeInsets.all(10),
                    height: 300,
                    child: Image.network(widget.product["image_url"]))),

            //name of the food
            SizedBox(
              child: Text(
                "Name: ${widget.product["food_name"]}",
                // ${widget.product["food_name"]}

                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //food code
            SizedBox(
              child: Text(
                "Code:  ${widget.product["food_code"]}",
                // "Code: ${widget.product["food_code"]}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(children: [
              //column for seller part box
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    const SizedBox(
                      child: Text(
                        "Seller Box",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent),
                      ),
                    ),
                    //seller offer part
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text(
                            "You Offered:",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "${widget.product["buyer_offer"]} TK",
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    //Total Item part
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text(
                            "Total Item:",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 40,
                            right: 10,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            " ${widget.product["total_item"]}",
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    //seller offer part
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text(
                            "Sellers Offer:",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            right: 10,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            widget.product["seller_offer"].toString(),
                            style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          ),
                        ),
                      ],
                    ),
                    //send button container
                    Row(
                      children: [
                        Container(
                          width: 170,
                          height: 70,
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.pink;
                                  }
                                  return Colors.greenAccent;
                                },
                              ),
                            ),
                            onPressed: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => const SignupScreen(),
                              //   ),
                              // );
                            },
                            child: const Text(
                              'Confirm',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                          ),
                        ),
                        Container(
                          width: 170,
                          height: 70,
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.pink;
                                  }
                                  return Colors.orangeAccent;
                                },
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BuyerOfferPlatform(widget.product),
                                ),
                              );
                            },
                            child: const Text(
                              'Try Again',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 26),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ])
          ]),
        ),
      ),
    );
    ;
  }
}
