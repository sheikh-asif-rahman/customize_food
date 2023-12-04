import 'package:flutter/material.dart';

class SellerOrderDetail extends StatefulWidget {
  var data;
  SellerOrderDetail(this.data);

  @override
  State<SellerOrderDetail> createState() => _SellerOrderDetailState();
}

class _SellerOrderDetailState extends State<SellerOrderDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 15,
        title: const Text(
          "Order Details",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        //go back from this page button------------------>//
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.deepOrange,
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
            //code for top side image of food//
            //=================================================//
            //==================================================//
            //image part
            Container(
              child: Image.network(widget.data["image_url"]),
              height: 300,
              margin: const EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              padding: const EdgeInsets.only(left: 50, right: 50),
              // width: 300,
            ),
            //name of the food
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                widget.data["food_name"],
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            //total cost
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
              ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Total Cost ${widget.data["total_cost"]} TK",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
            ),
            //total item
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 5,
              ),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Tota Item ${widget.data["total_item"]}",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
            ),
            Center(
              child: Container(
                height: 50,
                width: size.width * 0.8,
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.orangeAccent;
                        }
                        return Colors.white;
                      },
                    ),
                  ),
                  //on press response code
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => SwitchOption(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    'Ready For Deliver',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
