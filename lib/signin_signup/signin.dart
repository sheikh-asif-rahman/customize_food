import 'package:customize_food/firebase_auth/firebase_auth.dart';
import 'package:customize_food/signin_signup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscText = false;

  //signin function
  void loginUser() {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmailAndPasswoord(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      //background color of the page
      backgroundColor: const Color.fromARGB(255, 68, 79, 83),
      //for screen scroll availability
      body: SingleChildScrollView(
        //column for 2 seperate section
        child: Column(
          children: [
            //middle container
            Container(
              decoration: BoxDecoration(
                //middle container design
                color: const Color.fromARGB(221, 32, 38, 48),
                borderRadius: BorderRadius.circular(5),
                //design and position of shadow of middle container
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blue,
                    offset: Offset(0.0, -3.0),
                  )
                ],
              ),
              //position for middle container box.
              margin: const EdgeInsets.only(left: 20, right: 20, top: 250),

              child: Column(
                children: [
                  //FOOD level part at top
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: const Text(
                      "Food",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  //horizontal line part
                  Container(
                    height: 1,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    color: Colors.black,
                  ),
                  //please login here part
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: const Text(
                      "Please Login Here",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  //container for Email textbox
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    //decoration for border and color
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                    ),
                    alignment: Alignment.center,
                    child: TextFormField(
                      //get value to controller
                      controller: emailController,
                      cursorColor: Colors.blue,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                  //container for password
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                    ),
                    alignment: Alignment.center,
                    child: TextFormField(
                      obscureText: !obscText,
                      controller: passwordController,
                      cursorColor: Colors.blue,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          icon: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          labelText: "Password",
                          labelStyle: const TextStyle(color: Colors.white),
                          //button for paswword visibility
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: obscText ? Colors.blue : Colors.grey,
                            ),
                            //button click response
                            onPressed: () {
                              setState(() {
                                //if the obscText is false, then it will become true,
                                // if again pressed, then the true will become false again.
                                obscText = !obscText;
                              });
                              FocusScope.of(context).unfocus();
                            },
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                  //distance gap between paswwrod container and login button part
                  const SizedBox(height: 10),
                  //side by side 2 button is in row.
                  Row(
                    children: [
                      //I forgot my password textbutton
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: GestureDetector(
                          //on press response code
                          onTap: () => {},
                          child: const Text(
                            "I forgot my password",
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          ),
                        ),
                      ),
                      //container for login button
                      Container(
                        margin: const EdgeInsets.only(
                            left: 35, right: 20, bottom: 20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
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
                            loginUser();
                          },
                          child: const Text(
                            'Log in',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //2nd part
            //row for 2 item i one line
            Row(
              children: [
                //I don't have an account container
                Container(
                    margin:
                        const EdgeInsets.only(left: 30, right: 20, bottom: 20),
                    child: const Text(
                      "I don't have an account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                //registration button container
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Registration',
                      style: TextStyle(color: Colors.black, fontSize: 17),
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
