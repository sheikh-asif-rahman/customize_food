import 'package:customize_food/Hidden_Drawers/hidden_drawer_seller.dart';
import 'package:customize_food/Screens/Seller/Dashboard/Bargenning/seller_attempt.dart';
import 'package:flutter/material.dart';

class SellerOfferPlatform extends StatefulWidget {
  var product;
  SellerOfferPlatform(this.product);

  @override
  State<SellerOfferPlatform> createState() => _SellerOfferPlatformState();
}

class _SellerOfferPlatformState extends State<SellerOfferPlatform> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 15,
        title: const Text(
          "Buyer Offer To You",
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
                onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HiddenDrawerSeller(),
                      ),
                    ),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        ),
      ),
      body: _isLoading != true
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
                backgroundColor: Colors.blueGrey,
              ),
            )
          : SafeArea(
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
                      // ${widget.product["food_name"]}

                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  //food code
                  SizedBox(
                    child: Text(
                      "Code:  ${widget.product["food_code"]}",
                      // "Code: ${widget.product["food_code"]}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(children: [
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
                          //seller offer part
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                padding: const EdgeInsets.only(left: 10),
                                child: const Text(
                                  "You Offered:",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "${widget.product["buyer_offer"]} TK",
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          //Total Item part
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
                                margin: const EdgeInsets.only(
                                  left: 40,
                                  right: 10,
                                ),
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  " ${widget.product["total_item"]}",
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),

                          //seller offer part
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 10,
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
                                margin: const EdgeInsets.only(
                                  right: 10,
                                ),
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  widget.product["seller_offer"].toString(),
                                  style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent),
                                ),
                              ),
                            ],
                          ),
                          //send button container
                          Row(
                            children: [
                              Container(
                                width: 170,
                                height: 70,
                                padding: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.pink;
                                        }
                                        return Colors.greenAccent;
                                      },
                                    ),
                                  ),
                                  onPressed: () async {
                                    // if (widget.product["seller_offer"]
                                    //         .toString() ==
                                    //     "2") {
                                    //   showSnckBar(
                                    //       context, "Seller did't replyed!!");
                                    // } else {
                                    //   setState(() {
                                    //     _isLoading = false;
                                    //   });
                                    //   await confirm();
                                    // }
                                  },
                                  child: const Text(
                                    'Confirm',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 25),
                                  ),
                                ),
                              ),
                              //try again part
                              Container(
                                width: 170,
                                height: 70,
                                padding: const EdgeInsets.all(10),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.pink;
                                        }
                                        return Colors.orangeAccent;
                                      },
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SellerAttempt(widget.product),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Place My',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 26),
                                  ),
                                ),
                              ),
                            ],
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
