import 'package:flutter/material.dart';

class BargeningPlatform extends StatefulWidget {
  const BargeningPlatform({super.key});

  @override
  State<BargeningPlatform> createState() => _BargeningPlatformState();
}

class _BargeningPlatformState extends State<BargeningPlatform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 15,
        title: const Text(
          "Place Your Offer",
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
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(150),
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
                    onPressed: () async {
                      List<PersonEntry> persons = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SOF(),
                        ),
                      );
                      if (persons != null) persons.forEach(print);

                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => SignupScreen(),
                      //   ),
                      // );
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class SOF extends StatefulWidget {
  @override
  _SOFState createState() => _SOFState();
}

class _SOFState extends State<SOF> {
  int attempt = 3;
  var attemptCase = false;
  var productPrice = <TextEditingController>[];
  var productQuantity = <TextEditingController>[];
  var cards = <Card>[];

  Card createCard() {
    var quantityController = TextEditingController();
    var priceController = TextEditingController();
    productPrice.add(quantityController);
    productQuantity.add(priceController);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: const Text(
              'Yours Offer',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //container for quantity
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlueAccent,
            ),
            alignment: Alignment.center,
            child: TextFormField(
              controller: quantityController,
              cursorColor: Colors.blue,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.production_quantity_limits,
                    color: Colors.black,
                  ),
                  labelText: "Quantity",
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          //container for price
          Container(
            margin:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlueAccent,
            ),
            alignment: Alignment.center,
            child: TextFormField(
              controller: priceController,
              cursorColor: Colors.blue,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.attach_money_sharp,
                    color: Colors.black,
                  ),
                  labelText: "Price",
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  _onDone() {
    List<PersonEntry> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var quantity = productPrice[i].text;
      var price = productQuantity[i].text;
      entries.add(PersonEntry(quantity, price));
    }
    Navigator.pop(context, entries);
  }

  attemptTry() {
    setState(() => cards.add(createCard()));
    attempt = attempt--;
    if (attempt == 0) {
      setState(() => attemptCase = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: cards.length,
                itemBuilder: (BuildContext context, int index) {
                  return cards[index];
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  child: const Text('add new'),
                  onPressed: attemptCase ? null : attemptTry()),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.done), onPressed: _onDone),
    );
  }
}

class PersonEntry {
  final String quantity;
  final String price;

  PersonEntry(this.quantity, this.price);
  @override
  String toString() {
    return 'Person: quantity= $quantity, price= $price';
  }
}