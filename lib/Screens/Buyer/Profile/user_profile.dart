import 'package:customize_food/signin_signup/signin.dart';
import 'package:customize_food/signin_signup/switch_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 68, 79, 83),
      body: SingleChildScrollView(
        child: Container(
          padding:
          const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          child: Column(
            children: [
              //for upper part of image-------//
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("image/user.jpg"),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              //------------------------------//

              //name of the user-------------//
              const SizedBox(height: 10),
              const Text("Name",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold)),
              Text("Address",
                  style: TextStyle(
                      color: Colors.lightBlue[300],
                      fontSize: 24,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              //------------------------------//

              //edit box for edit profile-----//
              SizedBox(
                width: 190,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => {},
                  // onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  child: const Text("Edit Profile",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              //------------------------------//
              const SizedBox(height: 30),

              //divider for align all item in center and divide screen in to two part//
              const Divider(),
              //------------------------------//
              const SizedBox(height: 10),

              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(children: [
                  //code for Payments Methods button--------//
                  SizedBox(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.payment_outlined,
                          size: 30,
                          color: Colors.lightBlue,
                        ),
                        label: const Text(
                          "Payments Methods",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  //-------------------------------//
                  const SizedBox(height: 10),

                  //code for Notification button--------//
                  SizedBox(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          size: 30,
                          color: Colors.lightBlue,
                        ),
                        label: const Text(
                          "Notification",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  //-------------------------------//
                  const SizedBox(height: 10),

                  //code for switch account button--------//
                  SizedBox(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SwitchOption(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.swap_horizontal_circle_rounded,
                          size: 30,
                          color: Colors.yellowAccent,
                        ),
                        label: const Text(
                          "Switch platform",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  ),
                  //-------------------------------//
                  const SizedBox(height: 10),

                  //code for louout button--------//
                  SizedBox(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () {
                          showCupertinoDialog(
                              context: context,
                              builder: (BuildContext ctx) {
                                return CupertinoAlertDialog(
                                  title: const Text("Please Confirm"),
                                  content: const Text(
                                      "Are you sure to Logout from this Application?"),
                                  actions: [
                                    //yes button action------------------//
                                    CupertinoDialogAction(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SigninScreen(),
                                          ),
                                        );
                                      },
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
                        icon: const Icon(
                          Icons.logout_rounded,
                          size: 30,
                          color: Colors.orange,
                        ),
                        label: const Text(
                          "Logout",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  //-------------------------------//
                  const SizedBox(height: 10),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}