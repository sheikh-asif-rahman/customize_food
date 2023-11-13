import 'package:customize_food/Screens/Buyer/Statement/statement.dart';
import 'package:customize_food/screens/buyer/statement/statement_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Statement extends StatefulWidget {
  const Statement({super.key});

  @override
  State<Statement> createState() => _StatementState();
}

class _StatementState extends State<Statement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 68, 79, 83),
      body: SafeArea(
        //for list type page of order list//
        child: ListView.builder(
            itemCount: 15,
            itemBuilder: (_, index) {
              //click page route code//
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => StatementDetail()));
                },
                //card detail code//
                child: Card(
                  color: Colors.white60,
                  elevation: 10,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("image/burger.jpg"),
                    ),
                    title: const Column(
                      children: [
                        Center(
                          child: Text(
                            "Burger",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: Text(
                                "Price",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                "12/12/2012",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    subtitle: const Center(
                      child: Text(
                        "Shop Name",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    //report button-------------------------//
                    trailing: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: IconButton(
                          icon: const Icon(Icons.report),
                          onPressed: () {
                            showCupertinoDialog(
                                context: context,
                                builder: (BuildContext ctx) {
                                  return CupertinoAlertDialog(
                                    title: const Text("Please Confirm"),
                                    content: const Text(
                                        "Are you sure to Report this service?"),
                                    actions: [
                                      //yes button action------------------//
                                      CupertinoDialogAction(
                                        onPressed: () {},
                                        child: const Text('Yes'),
                                      ),
                                      //no button action-------------------//
                                      CupertinoDialogAction(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('No'),
                                      )
                                    ],
                                  );
                                });
                          },
                        )),
                  ),
                ),
              );
            }),
      ),
    );
  }
}