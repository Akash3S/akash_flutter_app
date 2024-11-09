import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'otp.dart';

class PhoneLogin extends StatefulWidget{
  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  TextEditingController phonenumber =TextEditingController();
  sendcode()async{
    try{
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+91'+phonenumber.text,
          verificationCompleted:(PhoneAuthCredential credential){},
          verificationFailed: (FirebaseAuthException e){
        Get.snackbar('Error Occured',e.code);
    },
    codeSent: (String vid,int? token){
        Get.to(Otp(vid:vid,),);
    },
    codeAutoRetrievalTimeout: (vid){}
      );


    }
    on FirebaseAuthException catch(e){
      Get.snackbar('Error Occured',e.code);
    }catch(e){
      Get.snackbar('Error Occured',e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Phone'),),
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Center(
         child: Column(
           children: [
             Text('Your Phone!',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
             TextField(
               controller: phonenumber,
               keyboardType: TextInputType.number,
               decoration: InputDecoration(
                 prefix:Text(" +91"),
                 prefixIcon: Icon(Icons.phone),
                 labelText: 'Enter phone number',

                hintStyle:TextStyle(color: Colors.grey),
                labelStyle:  TextStyle(color: Colors.grey),
                 enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.black)
                 ),
                 focusedBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color:Colors.black )
                 )
               ),
             ),
             SizedBox(height: 10,),
             ElevatedButton(onPressed: (){
               sendcode();
             },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Color.fromRGBO(90, 208, 248,1.0),
                     padding:  const EdgeInsets .all(16.0),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 90),
                   child: Text("Send otp",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                 )
             )

           ],
         ),
       ),
     ),

   );
  }
}