import 'package:akash_flutter_app/wraper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class Signup extends StatelessWidget{

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signup()async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
    Get.offAll(Wraper());
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title:Text("signup"),),

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
         Padding(
           padding: const EdgeInsets.all(15),
           child: TextField(
             controller: password,
             style: TextStyle(fontSize: 18,color: Colors.black),
             decoration: InputDecoration(
                 prefixIcon: Icon(Icons.password),
                 contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 15
                 ),hintText: 'pass',
                 enabledBorder:OutlineInputBorder(
                     borderRadius: BorderRadius.circular(15)

                 )
             ),

           ),
         ),
         ElevatedButton(
           onPressed: (()=>signup()) ,
           child: Text('Signup'),


         )

       ],
     ),

   );
  }

}