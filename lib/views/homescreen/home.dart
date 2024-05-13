import 'package:emart/Ui_helper/textstyle.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/views/Auth_screen/signup_screen.dart';
import 'package:emart/views/cart%20screen/Cart.dart';
import 'package:emart/views/category%20screen/category.dart';

import 'package:emart/views/homescreen/insidehome.dart';
import 'package:emart/views/profile%20screen/profile%20screen.dart';

class home extends StatefulWidget {
  const home({Key? key});


  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var navibaritemss = [
    BottomNavigationBarItem(
        icon: Image.asset(
          icHome,
          width: 25,
        ),
        label: "Home"),


    BottomNavigationBarItem(
        icon: Image.asset(
          icCategories,
          width: 25,
        ),
        label: "Categories"),
    BottomNavigationBarItem(
        icon: Image.asset(
          icCart,
          width: 25,
        ),
        label: "Cart"),
    BottomNavigationBarItem(
        icon: Image.asset(
          icProfile,
          width: 25,
        ),
        label: "Profile"),
  ];

  var bgcolor = [
    Colors.lightBlueAccent.shade100,
    Colors.red.shade500,
    Colors.purple,
    Colors.red.shade500,
  ];

  var email = TextEditingController();
  var currentindex = 0;
  var currentcolor = 0;

  @override
  Widget build(BuildContext context) {

    var rang = [
      Insidehome1(),

     Category1( updateIndex: (int newIndex) {
       setState(() {
         currentindex = newIndex;
       });
     },),
     cart1(updateIndex: (int newIndex) {
       setState(() {
         currentindex = newIndex;
       });
     },),
      profile( updateIndex: (int newIndex) {
        setState(() {
          currentindex = newIndex;
        });
      },),
    ];

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Container(child: rang.elementAt(currentindex)),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                setState(() {
                  currentindex = value;
                  currentcolor= value;
                });
              },
              selectedLabelStyle: tb15(rang: Colors.black),
              selectedItemColor: Colors.black,
              elevation: 2,
               backgroundColor: bgcolor.elementAt(currentcolor),
              currentIndex: currentindex,
              items: navibaritemss),
        ));
  }
}
