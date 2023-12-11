import 'package:flutter/material.dart';

class SellerAttempt extends StatefulWidget {
  var product;
  SellerAttempt(this.product);

  @override
  State<SellerAttempt> createState() => _SellerAttemptState();
}

class _SellerAttemptState extends State<SellerAttempt> {
  bool _isLoading = true;
  TextEditingController sellerPriceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 15,
        title: const Text(
          "Put My Offer",
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
            //image of the food
            Center(
                child: Container(
                    margin: EdgeInsets.all(10),
                    height: 300,
                    child: Image.network(widget.product["image_url"]))),
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
                    //total Item
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text(
                            "Total Item:",
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
                            "${widget.product["total_item"]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white),
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
                            "${widget.product["total_cost"]} TK",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    //Buyer Offered
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text(
                            "Buyer Offered:",
                            style: TextStyle(
                                fontSize: 24,
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
                            "${widget.product["buyer_offer"]} TK",
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
                            "My Offer:",
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
                            controller: sellerPriceController,
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
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      height: 50,
                      width: 200,
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
                        onPressed: () {},
                        child: const Text(
                          'Send',
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
