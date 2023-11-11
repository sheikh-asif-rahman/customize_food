import 'package:flutter/material.dart';

class SwitchOption extends StatelessWidget {
  const SwitchOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 15,
        title: const Text(
          "User Type",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 1,
                right: 1,
                top: 50,
                bottom: 50,
              ),
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Choose Your User Type",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue;
                      }
                      return Colors.yellowAccent;
                    },
                  ),
                ),
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => HiddenDrawerBuyer(),
                  //   ),
                  // );
                },
                child: const Text(
                  'BUYER',
                  style: TextStyle(color: Colors.black, fontSize: 70),
                ),
              ),
            ),
            const Icon(
              Icons.swap_vertical_circle_rounded,
              size: 80,
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue;
                      }
                      return Colors.deepOrangeAccent;
                    },
                  ),
                ),
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => HiddenDrawerSeller(),
                  //   ),
                  // );
                },
                child: const Text(
                  'SELLER',
                  style: TextStyle(color: Colors.black, fontSize: 70),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
