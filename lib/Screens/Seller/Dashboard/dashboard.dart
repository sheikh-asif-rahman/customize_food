import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPageSeller extends StatefulWidget {
  const DashboardPageSeller({super.key});

  @override
  State<DashboardPageSeller> createState() => _DashboardPageSellerState();
}

class _DashboardPageSellerState extends State<DashboardPageSeller> {
  @override
  Widget build(BuildContext context) {
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
            Row(
              children: [
                //container for Order Online
                Container(
                  height: 50,
                  margin: EdgeInsets.all(25),
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
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => SwitchOption(),
                      //   ),
                      // );
                    },
                    child: const Text(
                      'Orders Online',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
                //container for order pending
                Container(
                  height: 50,
                  margin: EdgeInsets.all(25),
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
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => SwitchOption(),
                      //   ),
                      // );
                    },
                    child: const Text(
                      'Order Pending',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                //container for ready for rider
                Container(
                  height: 50,
                  margin: EdgeInsets.all(20),
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
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => SwitchOption(),
                      //   ),
                      // );
                    },
                    child: const Text(
                      'Ready For Rider',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
                //container for Customer Message
                Container(
                  height: 50,
                  margin: EdgeInsets.all(20),
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
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => SwitchOption(),
                      //   ),
                      // );
                    },
                    child: const Text(
                      'Customer Chat',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ],
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
    SalesData("date-1", 100),
    SalesData("date-2", 200),
    SalesData("date-3", 300),
    SalesData("date-4", 700),
    SalesData("date-5", 500),
    SalesData("date-6", 100),
    SalesData("date-7", 600),
  ];
  return columnData;
}