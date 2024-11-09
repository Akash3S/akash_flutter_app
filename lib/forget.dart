import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Forget extends StatefulWidget{
  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {

  TextEditingController email = TextEditingController();

  reset()async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);

  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("forget screen"),),

body: Column(
    children: [
Padding(
padding: const EdgeInsets.all(15),
    child: TextField(
      controller: email,
      style: TextStyle(fontSize: 18,color: Colors.black),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 15
          ),hintText: 'mail',
          enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)

          )
      ),

    ),
  ),
      ElevatedButton(
        onPressed: (()=>reset()) ,
        child: Text('SendLink'),


      )

    ]
),
  );
  }
}