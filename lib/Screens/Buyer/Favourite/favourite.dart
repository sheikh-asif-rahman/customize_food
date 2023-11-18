import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customize_food/Screens/Buyer/Favourite/favourite_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavouriteFoodList extends StatefulWidget {
  const FavouriteFoodList({super.key});

  @override
  State<FavouriteFoodList> createState() => _FavouriteFoodListState();
}

class _FavouriteFoodListState extends State<FavouriteFoodList> {
  List items = [];
  //fetch data
  fetchFavourite() async {
    QuerySnapshot qnFav = await FirebaseFirestore.instance
        .collection("user-favourite-list")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .get();
    setState(() {
      for (int i = 0; i < qnFav.docs.length; i++) {
        items.add({
          "food_name": qnFav.docs[i]["food_name"],
          "food_price": qnFav.docs[i]["food_price"],
          "food_description": qnFav.docs[i]["food_description"],
          "image_url": qnFav.docs[i]["image_url"],
        });
      }
    });
    return qnFav.docs;
  }

  @override
  void initState() {
    fetchFavourite();
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
                Expanded(
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: items.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.8),
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            //onTap code here//
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          FavouriteDetail(items[index])))
                            },
                            child: Card(
                              elevation: 3,
                              child: Column(
                                children: [
                                  AspectRatio(
                                      aspectRatio: 1.25,
                                      // future code from data base
                                      child: Image.network(
                                          items[index]["image_url"])),
                                  Text(items[index]["food_name"],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "TK ${items[index]['food_price'].toString()}",
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
