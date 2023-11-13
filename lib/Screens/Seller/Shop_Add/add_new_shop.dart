import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class AddNewShop extends StatefulWidget {
  const AddNewShop({super.key});

  @override
  State<AddNewShop> createState() => _AddNewShopState();
}

class _AddNewShopState extends State<AddNewShop> {
  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIconLocation = ButtonState.idle;
  ButtonState stateTextWithIconCreate = ButtonState.idle;
  TextEditingController shopNameColntroller = TextEditingController();
  TextEditingController emailColntroller = TextEditingController();
  TextEditingController hotlineNumberColntroller = TextEditingController();
  TextEditingController branchNameColntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 15,
        title: const Text(
          "Add Your Shop",
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
      body: SingleChildScrollView(
        child: Column(children: [
          //container for Shop Name textbox
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            //decoration for border and color
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white54,
            ),
            alignment: Alignment.center,
            child: TextFormField(
              //get value to controller
              controller: shopNameColntroller,
              cursorColor: Colors.blue,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.house_outlined,
                    color: Colors.black54,
                  ),
                  labelText: "Shop Name",
                  labelStyle: TextStyle(color: Colors.black87),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          //container for Mail textbox
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            //decoration for border and color
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white54,
            ),
            alignment: Alignment.center,
            child: TextFormField(
              //get value to controller
              controller: emailColntroller,
              cursorColor: Colors.blue,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.mail_outline_outlined,
                    color: Colors.black54,
                  ),
                  labelText: "Mail Address",
                  labelStyle: TextStyle(color: Colors.black87),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          //container for HotLine Number textbox
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            //decoration for border and color
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white54,
            ),
            alignment: Alignment.center,
            child: TextFormField(
              //get value to controller
              controller: hotlineNumberColntroller,
              cursorColor: Colors.blue,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.phone,
                    color: Colors.black54,
                  ),
                  labelText: "Hotline Numner",
                  labelStyle: TextStyle(color: Colors.black87),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          //container for Branch Name textbox
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            //decoration for border and color
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white54,
            ),
            alignment: Alignment.center,
            child: TextFormField(
              //get value to controller
              controller: shopNameColntroller,
              cursorColor: Colors.blue,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.add_location_rounded,
                    color: Colors.black54,
                  ),
                  labelText: "Branch Name",
                  labelStyle: TextStyle(color: Colors.black87),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          //button for Location Of the shop
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ProgressButton.icon(
              maxWidth: 300.0,
              iconedButtons: {
                ButtonState.idle: IconedButton(
                  //this is text of the button
                  text: "Location",
                  //icon and color of icon
                  icon: Icon(Icons.map_outlined, color: Colors.white54),
                  //button background color
                  color: Colors.blue.shade900,
                ),
                //while loading code
                ButtonState.loading: IconedButton(
                  //this text may not show
                    text: "Processing",
                    //clor of the button will change while loading
                    color: Colors.blue.shade900),
                //while attemp gets fail
                ButtonState.fail: IconedButton(
                  text: "Failed To Get",
                  icon: Icon(Icons.cancel, color: Colors.black87),
                  color: Colors.redAccent,
                ),
                //while attemp gets success
                ButtonState.success: IconedButton(
                  text: "Location Added !",
                  icon: Icon(Icons.check_circle, color: Colors.black87),
                  color: Colors.green,
                ),
              },
              onPressed: () {
                //after click, interface will change
                switch (stateTextWithIconLocation) {
                  case ButtonState.idle:
                    stateTextWithIconLocation = ButtonState.loading;
                    Future.delayed(Duration(seconds: 1), () {
                      setState(() {
                        //depending on true false statement, it shows success or fail
                        stateTextWithIconLocation = Random.secure().nextBool()
                            ? ButtonState.success
                            : ButtonState.fail;
                      });
                    });
                    break;
                  case ButtonState.loading:
                    break;
                  case ButtonState.success:
                    stateTextWithIconLocation = ButtonState.idle;
                    break;
                  case ButtonState.fail:
                    stateTextWithIconLocation = ButtonState.idle;
                    break;
                }
                //it will set the button state
                setState(() {
                  stateTextWithIconLocation = stateTextWithIconLocation;
                });
              },
              state: stateTextWithIconLocation,
            ),
          ),

          //button for create Shop
          Container(
            width: 300,
            height: 50,
            margin: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blueGrey;
                    }
                    return Colors.yellowAccent;
                  },
                ),
              ),
              //on press response code
              onPressed: () {
                showCupertinoDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return CupertinoAlertDialog(
                        title: const Text("Your Shop is Created Successfully!"),
                        content:
                        const Text("Would You Like To Add your Menu Item?"),
                        actions: [
                          //yes button action------------------//
                          CupertinoDialogAction(
                            onPressed: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => AddMenuItem(),
                              //   ),
                              // );
                            },
                            child: const Text('Yes'),
                          ),
                          //no button action-------------------//
                          CupertinoDialogAction(
                            onPressed: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => HiddenDrawerSeller()));
                            },
                            child: const Text('No'),
                          )
                        ],
                      );
                    });
              },
              child: const Text(
                'Create Shop',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}