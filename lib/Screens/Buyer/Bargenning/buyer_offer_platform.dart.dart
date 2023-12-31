import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customize_food/Hidden_Drawers/hidden_drawer_buyer.dart';
import 'package:customize_food/utils/showSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BuyerOfferPlatform extends StatefulWidget {
  var product;
  BuyerOfferPlatform(this.product);
  @override
  State<BuyerOfferPlatform> createState() => _BuyerOfferPlatformState();
}

class _BuyerOfferPlatformState extends State<BuyerOfferPlatform> {
  int count = 1;
  int price = 1;
  var totalcost;

  TextEditingController buyerPriceController = TextEditingController();

  void increment() {
    setState(() {
      if (count < 15) {
        count++;
      }
    });
  }

  void decrement() {
    setState(() {
      if (count > 1) {
        count--;
      }
    });
  }

  int total() {
    setState(() {
      totalcost = count * price;
    });
    int totalPrice = count * price;
    return totalPrice;
  }

  //buyer send action
  send() async {
    if (buyerPriceController.text.isNotEmpty) {
      //buyer-offer-to-seller --- buyer mail --- order item --- seller mail --- foodname --- foodname --- details
      await FirebaseFirestore.instance
          .collection("buyer-offer-to-seller")
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
        "total_item": count,
        "total_cost": totalcost,
        "buyer_offer": buyerPriceController.text,
        "seller_offer": 0,
        "attempt_no": 1,
        "order_pending_status": false,
        "is_order_ready": false,
      });

      // Buyer-offer-notification --- seller mail --- order item --- buyer mail --- food
      await FirebaseFirestore.instance
          .collection("buyer-offer-notification")
          .doc(widget.product["seller_mail"].toString())
          .collection("order")
          .doc(FirebaseAuth.instance.currentUser!.email)
          .set({
        "food_name": widget.product["food_name"].toString(),
        "buyer_mail": FirebaseAuth.instance.currentUser!.email.toString(),
      });
      //store seller mail and food name
      await FirebaseFirestore.instance
          .collection("buyer-offer-to-seller-mail")
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection("seller-mail")
          .doc()
          .set({
        "seller_mail": widget.product["seller_mail"].toString(),
        "product_name": widget.product["food_name"].toString()
      }).then((value) => {
                showSnckBar(context, "Your Offer Placed!!"),
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HiddenDrawerBuyer(),
                  ),
                )
              });
    } else {
      showSnckBar(context, "Your Offer Box Is Empty !!");
    }
  }

  @override
  void initState() {
    price = int.parse(widget.product["food_price"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 15,
        title: const Text(
          "Your Offer",
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //food code
            SizedBox(
              child: Text(
                "Code: ${widget.product["food_code"]}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(children: [
              //column for user part box
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    //your box name
                    const SizedBox(
                      child: Text(
                        "Your Box",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent),
                      ),
                    ),

                    //increment decrement button part----------------//
                    Row(
                      children: [
                        //add how much item you want in count :
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.only(left: 30, right: 30),

                          // width: 100,
                          // height: 35,
                          child: const Text(
                            "Total Item:",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        //plus button
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: GestureDetector(
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 35,
                            ),
                            onTap: () {
                              //ontap action code here-----------//
                              increment();
                            },
                          ),
                        ),
                        //screen for increament decreament button action
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            count.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ),
                        //decreament button
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: GestureDetector(
                            child: const Icon(
                              Icons.remove,
                              color: Colors.black,
                              size: 35,
                            ),
                            onTap: () => {
                              //ontape action code
                              decrement()
                            },
                          ),
                        ),
                      ],
                    ),
                    //total price part
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text(
                            "Total Cost:",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          alignment: Alignment.centerRight,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Text(
                            "\TK ${total().toString()}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    //your offer part
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          padding: const EdgeInsets.only(left: 30),
                          child: const Text(
                            "Your Offer:",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 45,
                          width: 135,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            //get value to controller
                            controller: buyerPriceController,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //send button container
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      height: 50,
                      width: 200,
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
                          send();
                        },
                        child: const Text(
                          'Send',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ])
          ]),
        ),
      ),
    );
  }
}
