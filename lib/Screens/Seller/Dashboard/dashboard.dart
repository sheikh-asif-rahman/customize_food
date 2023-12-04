import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customize_food/Screens/Seller/Dashboard/Orders/orders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPageSeller extends StatefulWidget {
  const DashboardPageSeller({super.key});

  @override
  State<DashboardPageSeller> createState() => _DashboardPageSellerState();
}

class _DashboardPageSellerState extends State<DashboardPageSeller> {
  //orders count
  var orderCount;
  //message count
  int messageCount = 0;
  //order given by buyer mail
  List buyerMail = [];
  // normal-order-notification --- seller mail --- order item --- buyer mail --- food
  //fetch order notification
  fetchOderNotification() async {
    QuerySnapshot qnmail = await FirebaseFirestore.instance
        .collection("normal-order-notification")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("order")
        .get();
    setState(() {
      for (int i = 0; i < qnmail.docs.length; i++) {
        buyerMail.add({
          "food_name": qnmail.docs[i]["food_name"],
          "buyer_mail": qnmail.docs[i].id,
        });
      }
      orderCount = qnmail.docs.length;
    });
    return qnmail.docs;
  }

  @override
  void initState() {
    fetchOderNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: SafeArea(
        child: Column(
          children: [
            //container for graph
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              height: 350,
              child: SfCartesianChart(
                backgroundColor: Colors.blue[100],
                borderColor: Colors.black,
                title: ChartTitle(
                  text: "Last 7 days sells",
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(),
                series: <ChartSeries>[
                  ColumnSeries<SalesData, String>(
                      dataSource: getColumnData(),
                      xValueMapper: (SalesData sales, _) => sales.x,
                      yValueMapper: (SalesData sales, _) => sales.y,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            //customers offer button
            Container(
              height: 50,
              width: size.width * 0.8,
              margin: EdgeInsets.all(10),
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
                //on press response code
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => SwitchOption(),
                  //   ),
                  // );
                },
                child: const Text(
                  'Customers Offer',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            //orders
            Container(
              height: 50,
              width: size.width * 0.8,
              margin: EdgeInsets.all(10),
              //padding: const EdgeInsets.only(left: 20, right: 20),
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
                //on press response code
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => orderListSeller(buyerMail),
                    ),
                  );
                },
                child: orderCount != 0
                    ? Text(
                        'Orders ( $orderCount )',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )
                    : Text(
                        'Orders',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
              ),
            ),
            //message box
            Container(
              height: 50,
              width: size.width * 0.8,
              margin: EdgeInsets.all(10),
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
                //on press response code
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => SwitchOption(),
                  //   ),
                  // );
                },
                child: messageCount != 0
                    ? Text(
                        'Message ( $messageCount )',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )
                    : Text(
                        'Message',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  String x;
  double y;

  SalesData(this.x, this.y);
}

//value for the graph
dynamic getColumnData() {
  List<SalesData> columnData = <SalesData>[
    SalesData("Sat", 100),
    SalesData("Sun", 200),
    SalesData("Mon", 300),
    SalesData("Tue", 700),
    SalesData("Wen", 500),
    SalesData("Thu", 100),
    SalesData("Fri", 600),
  ];
  return columnData;
}
