import 'package:customize_food/screens/buyer/dashboard/bargening_platform.dart';
import 'package:customize_food/screens/buyer/dashboard/custom_make.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';

class PlaceOrderPage extends StatefulWidget {
  const PlaceOrderPage({super.key});

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  int count = 1;
  int price = 100;
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
    int totalPrice = count * price;
    return totalPrice;
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
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //container for image
              Container(
                  margin: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Image.asset(
                    "image/noodles.jpg",
                    height: 200,
                    width: 200,
                  )),
              //name of the food
              Container(
                margin: const EdgeInsets.only(
                  left: 100,
                  right: 100,
                ),
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: const Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
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
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
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
                            builder: (context) => BargeningPlatform(),
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
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.blue;
                            }
                            return Colors.white;
                          },
                        ),
                      ),
                      onPressed: () {
                        //onpress action code here
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
                margin:
                const EdgeInsets.only(left: 120, right: 5, bottom: 10, top: 10),
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CustomMake(),
                      ),
                    );
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