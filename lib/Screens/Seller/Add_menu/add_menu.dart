import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customize_food/Hidden_Drawers/hidden_drawer_seller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class AddMenuItem extends StatefulWidget {
  const AddMenuItem({super.key});

  @override
  State<AddMenuItem> createState() => _AddMenuItemState();
}

class _AddMenuItemState extends State<AddMenuItem> {
  //upload image to firebase storage
  String imageUrl = '';
  uploadImageToFirebase() async {
    String fileName = DateTime.now().microsecondsSinceEpoch.toString();
    try {
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('seller-product-image/$fileName.jpg');
      await ref.putFile(File(image!.path));
      imageUrl = await ref.getDownloadURL();
    } catch (e) {
      print(e);
    }
  }

  //upload item data to DB
  uploadToDB() async {
    await uploadImageToFirebase();
    FirebaseFirestore.instance
        .collection("menu")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("menu")
        .doc(foodNameController.text)
        .set({
      "food_code": foodCodeController.text,
      "food_name": foodNameController.text,
      "food_price": foodPriceController.text,
      "food_description": foodDescriptionController.text,
      "image_url": imageUrl.toString(),
      "seller_mail": FirebaseAuth.instance.currentUser!.email.toString(),
    });
  }

  //thisw will capture the image path
  XFile? image;
  // var img;
  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void _imageSelect() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  TextEditingController foodNameController = TextEditingController();
  TextEditingController foodDescriptionController = TextEditingController();
  TextEditingController foodPriceController = TextEditingController();
  TextEditingController foodCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 15,
        title: const Text(
          "Add Item",
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
        child: Column(
          children: [
            //box for food name
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
                controller: foodNameController,
                cursorColor: Colors.blue,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.local_pizza,
                      color: Colors.black,
                    ),
                    labelText: "Food Name",
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            //box for food price
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
                controller: foodPriceController,
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
            //box for food code
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
                controller: foodCodeController,
                cursorColor: Colors.blue,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.tag,
                      color: Colors.black,
                    ),
                    labelText: "Food Code",
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            //box for food detail
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlueAccent,
              ),
              alignment: Alignment.center,
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                controller: foodDescriptionController,
                cursorColor: Colors.blue,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.details_rounded,
                      color: Colors.black,
                    ),
                    labelText: "Food Description",
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                //choose image writing// after choose, pop up of image
                image != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(image!.path),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 200,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Icon(
                              Icons.photo,
                              size: 180,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            // padding: const EdgeInsets.only(left: 20, bottom: 20),
                            child: Text(
                              "Select Image",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                //upload photo container
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
                  padding: const EdgeInsets.only(left: 20, right: 20),
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
                    onPressed: () {
                      _imageSelect();
                    },
                    child: const Text(
                      'Select',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              width: 200,
              height: 50,
              margin:
                  const EdgeInsets.only(left: 5, right: 5, bottom: 20, top: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.pinkAccent;
                      }
                      return Colors.lightBlue.shade100;
                    },
                  ),
                ),
                onPressed: () {
                  print(image!.path);
                  print(imageUrl);
                  uploadToDB();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HiddenDrawerSeller(),
                    ),
                  );
                },
                child: const Text(
                  'Create',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
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
