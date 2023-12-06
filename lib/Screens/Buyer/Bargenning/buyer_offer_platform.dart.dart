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

  //buyer send action
  send() {}
  //sellers offer confirm
  confirm() {}

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
                            // controller: emailController,
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
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          height: 50,
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
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => const SignupScreen(),
                              //   ),
                              // );
                            },
                            child: const Text(
                              'Send',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: const Text(
                            "Attempt Left: 123",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //column for seller part box
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    const SizedBox(
                      child: Text(
                        "Seller Box",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent),
                      ),
                    ),
                    //your offer part
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text(
                            "Sellers Offer:",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 10, left: 35),
                          alignment: Alignment.center,
                          height: 45,
                          width: 135,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            //get value to controller
                            // controller: emailController,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 30,
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
                      margin: const EdgeInsets.only(
                        top: 20,
                      ),
                      width: 250,
                      height: 50,
                      padding: const EdgeInsets.only(right: 100),
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
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const SignupScreen(),
                          //   ),
                          // );
                        },
                        child: const Text(
                          'Confirm',
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
