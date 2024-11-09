import 'package:akash_flutter_app/wraper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class Otp extends StatefulWidget {
  final String vid;

  const Otp({super.key, required this.vid});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String code = '';

  void signInPhone() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.vid, // Fixed: Use widget.vid instead of Widget.vid
        smsCode: code,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offAll(() => Wraper()); // Fixed: Added function call
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error Occurred', e.code);
    } catch (e) {
      Get.snackbar('Error Occurred', e.toString());
    }
  }

  Widget textCode() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Pinput(
          length: 6,
          onChanged: (value) {
            setState(() {
              code = value; // Fixed: Update the code variable directly
            });
          },
        ),
      ),
    );
  }

  Widget button() {
    return Center(
      child: ElevatedButton(
        onPressed: signInPhone, // Added: Connect button to sign in function
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(140, 178, 241, 1),
          padding: const EdgeInsets.all(16.0),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 80),
          child: Text(
            "Verify & Proceed",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              const Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              textCode(),
              const SizedBox(height: 20),
              button(),
            ],
          ),
        ),
      ),
    );
  }
}