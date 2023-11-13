import 'package:flutter/material.dart';

class FavouriteFoodList extends StatefulWidget {
  const FavouriteFoodList({super.key});

  @override
  State<FavouriteFoodList> createState() => _FavouriteFoodListState();
}

class _FavouriteFoodListState extends State<FavouriteFoodList> {
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
                            onTap: () => {},
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