import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customize_food/Screens/Seller/Add_menu/add_menu.dart';
import 'package:customize_food/Screens/Seller/Add_menu/product_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  //list of menu
  List menu = [];
  //fetch products of menu
  fetchMenu() async {
    QuerySnapshot qnmenu = await FirebaseFirestore.instance
        .collection("menu")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("menu")
        .get();
    setState(() {
      for (int i = 0; i < qnmenu.docs.length; i++) {
        menu.add({
          "food_name": qnmenu.docs[i]["food_name"],
          "food_code": qnmenu.docs[i]["food_code"],
          "food_price": qnmenu.docs[i]["food_price"],
          "food_description": qnmenu.docs[i]["food_description"],
          "image_url": qnmenu.docs[i]["image_url"],
          "seller_mail": qnmenu.docs[i]["seller_mail"]
        });
      }
    });
    return qnmenu.docs;
  }

  @override
  void initState() {
    fetchMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
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
                //first part of this page
                //add new item and button inside yhis row
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const Text(
                        "Add Your New Item",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    //plus button code
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.amberAccent;
                                }
                                return Colors.greenAccent;
                              },
                            ),
                          ),
                          //on press response code
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddMenuItem(),
                            ));
                          },
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),

                Expanded(
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: menu.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.8),
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            //onTap code here//
                            onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetail(menu[index]),
                              ))
                            },
                            child: Card(
                              elevation: 3,
                              child: Column(
                                children: [
                                  AspectRatio(
                                      aspectRatio: 1.25,
                                      //future code from data base
                                      child: Image.network(
                                          menu[index]["image_url"])),
                                  Text(menu[index]["food_name"],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "TK ${menu[index]['food_price'].toString()}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })),
              ]),
        ),
      ),
    );
  }
}
