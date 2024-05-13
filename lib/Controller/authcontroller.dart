

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/Ui_helper/alert%20box.dart';
import 'package:emart/consts/consts.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authcontroller extends GetxController {
  Future<UserCredential?> loginmethod(BuildContext context,{required String email, required String password}) async {
    UserCredential? usercredential;
    try {usercredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {customalertbox(context, e.code.toString(), (){});}
    return usercredential;
  }

  //signup method
Future<UserCredential?> signupmethod (context, email,password) async {
    UserCredential?usercredential;
    try{usercredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);}
        on FirebaseAuthException catch (e){customalertbox(context, e.code.toString(), (){});}
        return usercredential;
}

//Storing data method

storeuserdata({name,password,email})async {
    DocumentReference store=  FirebaseFirestore.instance.collection("users").doc(currentuser!.uid);
    store.set({
      'name':"name",
      'password':"password",
      'email':"email",
      'imageurl':""
    });
}
// logout method

signout(context){
    try {FirebaseAuth.instance.signOut();}
        on FirebaseAuthException catch (e){customalertbox(context, e.code.toString(), (){});}
}
}