import 'package:customize_food/Screens/Seller/Add_menu/product_detail.dart';
import 'package:flutter/material.dart';

import 'add_menu.dart';
class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => AddMenuItem(),
                            // ));
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
                        //itemCount: products.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.8),
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            //onTap code here//
                            onTap: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductDetail(),
                              ))
                            },
                            child: const Card(
                              elevation: 3,
                              child: Column(
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1.25,
                                    //future code from data base
                                    //     child:
                                    //         Image.network(products[index]["image"][0])),
                                    // Text(products[index]["name"],
                                    //     style: const TextStyle(
                                    //         fontWeight: FontWeight.bold, fontSize: 25)),
                                    // const SizedBox(
                                    //   height: 5,
                                    // ),
                                    // Text(
                                    //   "TK ${products[index]['price'].toString()}",
                                    //   style: const TextStyle(
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: 20,
                                    //       color: Colors.red),
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