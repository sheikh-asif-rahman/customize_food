import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customize_food/screens/buyer/dashboard/bargening_platform.dart';
import 'package:customize_food/utils/showSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PlaceOrderPage extends StatefulWidget {
  var product;
  PlaceOrderPage(this.product);

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  bool _isLoading = true;
  //place order to sellet datbase
  placeBuyerOrder() async {
    //buyer normal order --- buyer mail --- order item --- seller mail --- food name --- items etc
    await FirebaseFirestore.instance
        .collection("buyer-normal-order")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("order-item")
        .doc(widget.product["seller_mail"].toString())
        .collection(widget.product["food_name"].toString())
        .doc()
        .set({
      "food_code": widget.product["food_code"].toString(),
      "food_name": widget.product["food_name"].toString(),
      "food_price": widget.product["food_price"].toString(),
      "food_description": widget.product["food_description"].toString(),
      "image_url": widget.product["image_url"].toString(),
      "seller_mail": widget.product["seller_mail"].toString(),
      "total_item": count,
      "total_cost": totalcost,
    });
    // normal-order-notification --- seller mail --- order item --- buyer mail --- food
    await FirebaseFirestore.instance
        .collection("normal-order-notification")
        .doc(widget.product["seller_mail"].toString())
        .collection("order")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .set({"food_name": widget.product["food_name"].toString()});
    setState(() {});
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
  }

  int count = 1;
  int price = 1;
  var totalcost;

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

  @override
  void initState() {
    price = int.parse(widget.product["food_price"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 15,
        title: const Text(
          "Place Your Order",
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
      body: _isLoading != true
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
                backgroundColor: Colors.blueGrey,
              ),
            )
          : SafeArea(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //container for image
                Container(
                    height: 300,
                    margin: const EdgeInsets.only(
                      left: 50,
                      right: 50,
                    ),
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Image.network(widget.product["image_url"])),
                //name of the food
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    widget.product["food_name"],
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
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
                      padding: const EdgeInsets.only(left: 30),
                      child: const Text(
                        "Your Cost:",
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
                //Delivery location pickup button
                Container(
                  margin: const EdgeInsets.only(
                    left: 85,
                    right: 85,
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.pink;
                          }
                          return Colors.blue;
                        },
                      ),
                    ),
                    onPressed: () {
                      //onpress action code here
                    },
                    child: const Row(
                      children: [
                        Text(
                          'Delivery Location',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.map_sharp)
                      ],
                    ),
                  ),
                ),

                Row(
                  children: [
                    //bargening button
                    Container(
                      margin: const EdgeInsets.only(
                          left: 40, right: 10, bottom: 10, top: 10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.blue;
                              }
                              return Colors.pinkAccent;
                            },
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  BargeningPlatform(widget.product),
                            ),
                          );
                        },
                        child: const Text(
                          'Bargening',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    //place my order part
                    Container(
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.blue;
                              }
                              return Colors.white;
                            },
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            _isLoading = false;
                          });
                          await placeBuyerOrder();
                        },
                        child: const Text(
                          'Place my Order',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),

                //button for customize food
                Container(
                  margin: const EdgeInsets.only(
                      left: 120, right: 5, bottom: 10, top: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.blue;
                          }
                          return Colors.orange;
                        },
                      ),
                    ),
                    onPressed: () {
                      //onpress action code here
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => CustomMake(),
                      //   ),
                      // );
                    },
                    child: const Text(
                      'Make it Custom for me',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                //side by side button for order and cart
              ],
            )),
    );
  }
}
