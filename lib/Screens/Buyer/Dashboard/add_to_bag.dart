import 'package:customize_food/Screens/Buyer/Dashboard/place_order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddToBag extends StatefulWidget {
  const AddToBag({super.key});

  @override
  State<AddToBag> createState() => _AddToBagState();
}

class _AddToBagState extends State<AddToBag> {
  //rating value variable
  double rating = 2;
  int count = 1;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 68, 79, 83),
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
        //---------------------------------------------------//
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              child: IconButton(
                  onPressed: () {
                    //on press code here
                  },
                  icon: Icon(
                    Icons.favorite,
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
                child: Image.asset(
                  "image/noodles.jpg",
                  height: 300,
                  width: 300,
                )),
            //=================================================//
            //==================================================//
            //name of the food
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: const Text(
                "Name",
                style: TextStyle(
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
              child: const Text(
                "price",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent),
              ),
            ),
            //name of the shop
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
              ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: const Text(
                "shope name",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
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
                          builder: (context) => PlaceOrderPage(),
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
            Expanded(
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 0.8),
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 20, bottom: 50),
                        color: Colors.grey,
                        child: Column(
                          children: [
                            //name of customer part
                            Text(
                              "Name",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            RatingBar.builder(
                              ignoreGestures: true, // <---- add this
                              initialRating: rating,
                              allowHalfRating: true,
                              //minRating: 1,
                              itemSize: 25,
                              itemPadding: EdgeInsets.symmetric(horizontal: 2),
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

                            //rating time and date
                            Text(
                              "Date and time",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      );
                    })),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(left: 20, bottom: 20),
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: () {
                          //on press code here
                        },
                        icon: Icon(
                          Icons.info_sharp,
                          color: Colors.black,
                        )),
                  ),
                ),
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
