// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class AddMenuItem extends StatefulWidget {
//   const AddMenuItem({super.key});
//
//   @override
//   State<AddMenuItem> createState() => _AddMenuItemState();
// }
//
// class _AddMenuItemState extends State<AddMenuItem> {
//   XFile? image;
//   final ImagePicker picker = ImagePicker();
//   Future getImage(ImageSource media) async {
//     var img = await picker.pickImage(source: media);
//
//     setState(() {
//       image = img;
//     });
//   }
//
//   //show popup dialog
//   void myAlert() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//             title: Text('Please choose media to select'),
//             content: Container(
//               height: MediaQuery.of(context).size.height / 6,
//               child: Column(
//                 children: [
//                   ElevatedButton(
//                     //if user click this button, user can upload image from gallery
//                     onPressed: () {
//                       Navigator.pop(context);
//                       getImage(ImageSource.gallery);
//                     },
//                     child: Row(
//                       children: [
//                         Icon(Icons.image),
//                         Text('From Gallery'),
//                       ],
//                     ),
//                   ),
//                   ElevatedButton(
//                     //if user click this button. user can upload image from camera
//                     onPressed: () {
//                       Navigator.pop(context);
//                       getImage(ImageSource.camera);
//                     },
//                     child: Row(
//                       children: [
//                         Icon(Icons.camera),
//                         Text('From Camera'),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
//   TextEditingController foodNameController = TextEditingController();
//   TextEditingController foodDescriptionController = TextEditingController();
//   TextEditingController foodPriceController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         elevation: 15,
//         title: const Text(
//           "Add Item",
//           style: TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
//         ),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         //go back from this page button------------------>//
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: CircleAvatar(
//             backgroundColor: Colors.blue[900],
//             child: IconButton(
//                 onPressed: () => Navigator.pop(context),
//                 icon: const Icon(
//                   Icons.arrow_back,
//                   color: Colors.white,
//                 )),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             //box for food name
//             Container(
//               margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               decoration: BoxDecoration(
//                 border: Border.all(width: 3, color: Colors.black),
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.lightBlueAccent,
//               ),
//               alignment: Alignment.center,
//               child: TextFormField(
//                 controller: foodNameController,
//                 cursorColor: Colors.blue,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                     icon: Icon(
//                       Icons.local_pizza,
//                       color: Colors.black,
//                     ),
//                     labelText: "Food Name",
//                     labelStyle: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                     enabledBorder: InputBorder.none,
//                     focusedBorder: InputBorder.none),
//               ),
//             ),
//             //box for food price
//             Container(
//               margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               decoration: BoxDecoration(
//                 border: Border.all(width: 3, color: Colors.black),
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.lightBlueAccent,
//               ),
//               alignment: Alignment.center,
//               child: TextFormField(
//                 controller: foodPriceController,
//                 cursorColor: Colors.blue,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                     icon: Icon(
//                       Icons.attach_money_sharp,
//                       color: Colors.black,
//                     ),
//                     labelText: "Price",
//                     labelStyle: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                     enabledBorder: InputBorder.none,
//                     focusedBorder: InputBorder.none),
//               ),
//             ),
//             //box for food detail
//             Container(
//               margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               decoration: BoxDecoration(
//                 border: Border.all(width: 3, color: Colors.black),
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.lightBlueAccent,
//               ),
//               alignment: Alignment.center,
//               child: TextField(
//                 keyboardType: TextInputType.multiline,
//                 minLines: 1,
//                 maxLines: 5,
//                 controller: foodDescriptionController,
//                 cursorColor: Colors.blue,
//                 style: const TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                     icon: Icon(
//                       Icons.details_rounded,
//                       color: Colors.black,
//                     ),
//                     labelText: "Food Description",
//                     labelStyle: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                     enabledBorder: InputBorder.none,
//                     focusedBorder: InputBorder.none),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: [
//                 //choose image writing// after choose, pop up of image
//                 image != null
//                     ? Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.file(
//                       File(image!.path),
//                       fit: BoxFit.cover,
//                       width: MediaQuery.of(context).size.width * 0.5,
//                       height: 200,
//                     ),
//                   ),
//                 )
//                     : Container(
//                   margin: const EdgeInsets.all(20),
//                   padding: const EdgeInsets.only(left: 20, bottom: 20),
//                   child: Text(
//                     "Choose Image",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 //upload photo container
//                 Container(
//                   margin: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
//                   padding: const EdgeInsets.only(left: 20, right: 20),
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                             (Set<MaterialState> states) {
//                           if (states.contains(MaterialState.pressed)) {
//                             return Colors.blue;
//                           }
//                           return Colors.white;
//                         },
//                       ),
//                     ),
//                     onPressed: () {
//                       myAlert();
//                     },
//                     child: const Text(
//                       'Upload',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             Container(
//               width: 200,
//               height: 50,
//               margin:
//               const EdgeInsets.only(left: 5, right: 5, bottom: 20, top: 20),
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                         (Set<MaterialState> states) {
//                       if (states.contains(MaterialState.pressed)) {
//                         return Colors.pinkAccent;
//                       }
//                       return Colors.lightBlue.shade100;
//                     },
//                   ),
//                 ),
//                 onPressed: () {
//                   // Navigator.of(context).push(
//                   //   MaterialPageRoute(
//                   //     builder: (context) => HiddenDrawerSeller(),
//                   //   ),
//                   // );
//                 },
//                 child: const Text(
//                   'Create',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }