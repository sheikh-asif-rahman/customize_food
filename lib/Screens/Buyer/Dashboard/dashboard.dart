import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'add_to_bag.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardPageBuyer extends StatefulWidget {
  const DashboardPageBuyer({super.key});

  @override
  State<DashboardPageBuyer> createState() => _DashboardPageBuyerState();
}

class _DashboardPageBuyerState extends State<DashboardPageBuyer> {
  //rating variable for star
  double rating = 2;
  //variable for search box data//
  var inputText = "";
  List email = [];
  List products = [];
  var menulen = 0;
  var firestoreInstance = FirebaseFirestore.instance;

  //fetch products
  fetchProducts() async {
    QuerySnapshot qnmail =
        await firestoreInstance.collection("menu-holder-user-list").get();
    for (int i = 0; i < qnmail.docs.length; i++) {
      setState(() {
        email.add(qnmail.docs[i].id);
      });
      QuerySnapshot qnmenu = await firestoreInstance
          .collection("menu")
          .doc(email[i])
          .collection("menu")
          .get();
      for (int j = 0; j < qnmenu.docs.length; j++) {
        setState(() {
          products.add({
            "food_name": qnmenu.docs[j]["food_name"],
            "food_code": qnmenu.docs[j]["food_code"],
            "food_price": qnmenu.docs[j]["food_price"],
            "food_description": qnmenu.docs[j]["food_description"],
            "image_url": qnmenu.docs[j]["image_url"],
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //for screen size generate of device----------------------//
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 68, 79, 83),
      //to get scroll able page up down//
      body: SafeArea(
          //inside a safe area of user device, work on container------//
          child: Container(
        padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        //as a cloumn, we think the screen elements-------------//
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //top side tages code-----------------------------------//

            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.centerLeft,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Most searched -",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection:
                  Axis.horizontal, //to scroll side by side-------//
              //for row part design of tages----------------------------------//
              child: Row(children: [
                //image button part 1----------------------------------------//
                Container(
                  height: 100,
                  width: 100,
                  // margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  // padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "image/burger.jpg",
                              height: 60,
                            ),
                          ),
                          const Text(
                            "Burger",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          )
                        ],
                      )),
                ),

                Container(
                  height: 100,
                  width: 100,
                  // margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  // padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "image/burger.jpg",
                              height: 60,
                            ),
                          ),
                          const Text(
                            "Burger",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          )
                        ],
                      )),
                ),

                Container(
                  height: 100,
                  width: 100,
                  // margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  // padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "image/burger.jpg",
                              height: 60,
                            ),
                          ),
                          const Text(
                            "Burger",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          )
                        ],
                      )),
                ),

                Container(
                  height: 100,
                  width: 100,
                  // margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  // padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "image/burger.jpg",
                              height: 60,
                            ),
                          ),
                          const Text(
                            "Burger",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          )
                        ],
                      )),
                ),

                Container(
                  height: 100,
                  width: 100,
                  // margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  // padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "image/burger.jpg",
                              height: 60,
                            ),
                          ),
                          const Text(
                            "Burger",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          )
                        ],
                      )),
                ),

                Container(
                  height: 100,
                  width: 100,
                  // margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  // padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "image/burger.jpg",
                              height: 60,
                            ),
                          ),
                          const Text(
                            "Burger",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          )
                        ],
                      )),
                ),

                Container(
                  height: 100,
                  width: 100,
                  // margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  // padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "image/burger.jpg",
                              height: 60,
                            ),
                          ),
                          const Text(
                            "Burger",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          )
                        ],
                      )),
                ),

                Container(
                  height: 100,
                  width: 100,
                  // margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  // padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "image/burger.jpg",
                              height: 60,
                            ),
                          ),
                          const Text(
                            "Burger",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          )
                        ],
                      )),
                ),
              ]),
            ),

            //for the gap--------------------------//
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.center,
              //height between this container and top bar//
              height: 0.09 * screenSize.height,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "HOW HUNGRY ARE YOU TODAY?",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            //search box container starts here//
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
              ),
              alignment: Alignment.center,
              child: const TextField(
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.black,
                    ),
                    hintText: "Search Your Food Here!!",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
                //onchange code here ------>//
              ),
            ),
            const SizedBox(height: 20),
            //code for bottom part cart item//
            Expanded(
                //all products come here
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.88),
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        //onTap code here//
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AddToBag())),
                        //card code starts here
                        child: Card(
                          elevation: 3,
                          child: Column(
                            children: [
                              AspectRatio(
                                  //area that image will take of the card
                                  aspectRatio: 1.50,
                                  child: Image.network(
                                      products[index]["image_url"])),
                              Text(products[index]["food_name"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                              Text(
                                "TK ${products[index]['food_price'].toString()}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.red),
                              ),
                              //rating part code
                              RatingBar.builder(
                                ignoreGestures: true, // <---- add this
                                initialRating: rating,
                                allowHalfRating: true,
                                //minRating: 1,
                                itemSize: 25,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 1),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                updateOnDrag: true,
                                //set rating from variable value
                                onRatingUpdate: (rating) => setState(() {
                                  //rating = variable rating value
                                  this.rating = rating;
                                }),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
          ],
        ),
      )),
    );
  }
}
