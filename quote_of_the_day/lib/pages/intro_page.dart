import 'package:flutter/material.dart';
import 'package:quote_of_the_day/pages/login_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = 30;
    double width = 30;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Image.asset(
              "images/quote.png",
              height: height,
              width: width,
            ),
            const SizedBox(
              height: 50,
            ),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                    fontFamily: 'Lato', fontSize: 50, color: Colors.black),
                children: [
                  TextSpan(text: "Get\n"),
                  TextSpan(
                    text: "Inspired",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  "Let's Go",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
