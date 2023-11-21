import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  var product;
  ProductDetail(this.product);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 15,
        title: const Text(
          "Product Detail",
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
      backgroundColor: Colors.indigoAccent,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            child: Image.network(widget.product["image_url"]),
            height: 300,
            // width: 300,
          ),
          //=================================================//
          //==================================================//
          //name of the food
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              widget.product["food_name"],
              style: const TextStyle(
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
            child: Text(
              "${widget.product["food_price"]} TK",
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent),
            ),
          ),
          //description
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 5,
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "${widget.product["food_description"]} TK",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
