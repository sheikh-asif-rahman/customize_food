import 'package:customize_food/firebase_auth/firebase_auth.dart';
import 'package:customize_food/signin_signup/signin.dart';
import 'package:customize_food/signin_signup/switch_option.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //control variable
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscText = false;

  void signUpUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//this variable holds the devices screen size.
    return initWidget(); //from this widget, we call our page design code.
  }

  //from here, code starts for page design
  Widget initWidget() {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 68, 79, 83),
      body: SingleChildScrollView(
        //for screen scroll availability
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                //middle container design
                color: Color.fromARGB(221, 32, 38, 48),
                borderRadius: BorderRadius.circular(5),
                //design and position of shadow of middle container
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue,
                    offset: Offset(0.0, -3.0),
                  )
                ],
              ),
              //position for middle container box.
              margin: EdgeInsets.only(left: 20, right: 20, top: 100),

              child: Column(
                children: [
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
                  Container(
                    height: 1,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    color: Colors.black,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: const Text(
                      "Please Register Here",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
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
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: obscText ? Colors.blue : Colors.grey,
                            ),
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
                  const SizedBox(height: 30),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 200, right: 20, bottom: 20),
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
                      onPressed: () {
                        signUpUser();
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                    margin:
                        const EdgeInsets.only(left: 30, right: 20, bottom: 20),
                    child: const Text(
                      "Already Have Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                          builder: (context) => SigninScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(color: Colors.black, fontSize: 22),
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
