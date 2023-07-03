import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sareeshowroom/screens/home_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/showroom.jpeg'),
            const Text(
              'Welcome to Saree Showroom',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => HomeScreen());
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
