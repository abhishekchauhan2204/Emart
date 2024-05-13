import 'dart:async';
import 'package:emart/consts/consts.dart';
import 'package:emart/main.dart';
import 'package:emart/views/Auth_screen/login_screen.dart';
import 'package:emart/widgets_common/app_logo_widgets.dart';
import 'package:flutter/material.dart';

import '../../Ui_helper/textstyle.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return signin();
    },)); });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 apxx(),
                  Text(
                    appname,
                    style: tb30(),
                  ),
                  Text(
                    appversion,
                    style: TextStyle(fontSize: 15),
                  ),
                ],),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(credits,style: tb30(),),
            )
          ],),),);
  }
}
