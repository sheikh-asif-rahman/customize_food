import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customize_food/Screens/Buyer/Dashboard/place_order_page.dart';
import 'package:customize_food/utils/showSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavouriteDetail extends StatefulWidget {
  var products;
  FavouriteDetail(this.products);

  @override
  State<FavouriteDetail> createState() => _FavouriteDetailState();
}

class _FavouriteDetailState extends State<FavouriteDetail> {
  //alert box code
  showAlertDialog() {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Food Description"),
      content: Text(widget.products["food_description"]),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 15,
        title: const Text(
          "Food Detail",
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              child: IconButton(
                  onPressed: () {
                    //remove from favourite db list
                    FirebaseFirestore.instance
                        .collection("user-favourite-list")
                        .doc(FirebaseAuth.instance.currentUser!.email)
                        .collection("items")
                        .doc(widget.products["food_code"].toString())
                        .delete()
                        .then(
                            (value) => showSnckBar(context, "Item Removed!!"));
                  },
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.white,
                  )),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //code for top side image of food//
            //=================================================//
            //==================================================//
            //image part
            Container(
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Image.network(widget.products["image_url"]),
              height: 300,
              // width: 300,
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
                widget.products["food_name"],
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
                "${widget.products["food_price"]} TK",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent),
              ),
            ),
            Row(
              children: [
                //place Order
                Container(
                  margin: const EdgeInsets.only(
                      left: 50, right: 25, bottom: 10, top: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.deepOrange;
                          }
                          return Colors.blue;
                        },
                      ),
                    ),
                    onPressed: () {
                      //onpress action code here
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PlaceOrderPage(widget.products),
                        ),
                      );
                    },
                    child: const Text(
                      'Place Order',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                //add to cart
                Container(
                  margin: const EdgeInsets.only(
                      left: 15, right: 50, bottom: 10, top: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.blue;
                          }
                          return Colors.orangeAccent;
                        },
                      ),
                    ),
                    onPressed: () {
                      //onpress action code here
                    },
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            //star and comment part
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //description button code
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(left: 20, bottom: 20),
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: () {
                          showAlertDialog();
                        },
                        icon: Icon(
                          Icons.info_sharp,
                          color: Colors.black,
                        )),
                  ),
                ),
                //message button code
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(
                        onPressed: () {
                          //on press code here
                        },
                        icon: Icon(
                          Icons.message_outlined,
                          color: Colors.white,
                        )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
