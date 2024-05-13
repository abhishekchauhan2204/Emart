import 'dart:io';

import 'package:emart/Ui_helper/textstyle.dart';
import 'package:emart/consts/consts.dart';

import 'package:emart/views/splashscreen/splashscreen.dart';
import 'package:emart/widgets_common/app_logo_widgets.dart';
import 'package:emart/widgets_common/bg_widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
options: FirebaseOptions(apiKey: "AIzaSyD1iwcqAipDng_9X1GKSjB457z5NdoaQFs",
    appId: "1:258092324538:android:65664a2adf5be1ef17d483",
    messagingSenderId: "258092324538",
    projectId: "emart1-89ac6")
  )
:Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Emart',
        theme: ThemeData(
          fontFamily: italicbold,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),

           appBarTheme: AppBarTheme(
               titleTextStyle: tb25(),

               centerTitle: true,color:Theme.of(context).colorScheme.inversePrimary),
          useMaterial3: true,
        ),
        home: splashscreen());
  }
}
