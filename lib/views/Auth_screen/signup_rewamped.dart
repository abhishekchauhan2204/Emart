import 'package:emart/Controller/authcontroller.dart';
import 'package:emart/Ui_helper/Textfield.dart';
import 'package:emart/Ui_helper/alert%20box.dart';
import 'package:emart/Ui_helper/textstyle.dart';
import 'package:emart/main.dart';
import 'package:emart/views/Auth_screen/signup_rewamped.dart';
import 'package:emart/views/Auth_screen/signup_screen.dart';
import 'package:emart/views/homescreen/home.dart';
import 'package:emart/widgets_common/app_logo_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../consts/consts.dart';
import 'login_screen.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  var email = TextEditingController();
  var password = TextEditingController();
  bool _isloading = false;

  @override
  Widget build(BuildContext context) {
    var responsiveheight = MediaQuery
        .of(context)
        .size
        .height;
    var height = responsiveheight * .1;
    var height1 = responsiveheight * .04;

    usercredentials(String email, String password) async {
      setState(() {
        _isloading =true;
      });
      if (email == "" && password == "") {
        customalertbox(context, "please fill the requried fields",(){setState(() {
          _isloading=false;
        });});
      } else {
        UserCredential? usercredential;
        try {
          usercredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
              .then((value) => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) {
            return home();
          },)));
        } on FirebaseAuthException catch (ex) {
          customalertbox(context, ex.code.toString(),(){});
        }finally {setState(() {
          _isloading = false;
        });}
      }
    }

    return  GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imgBackground), fit: BoxFit.fill)),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: height1,
                ),
                apxx(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Signup to Emart',
                  style: tb25(),
                ),
                Column(
                  children: [
                    Container(
                      height: height,
                    ),
                    customtextfield(false, email, Icons.email, 'Email'),
                    SizedBox(
                      height: 10,
                    ),
                    customtextf(
                        tohide: true,
                        controller: password,
                        text: 'password',
                        iconData: Icons.visibility),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          usercredentials(email.text.toString(), password.text.toString());
                        },
                        child: _isloading?CircularProgressIndicator():Text(
                          'Signup',
                          style: tb25(),
                        )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Text
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Already have a account',
                            style: tb20(),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        //Login button
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Expanded(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return signin();
                                        },
                                      ));
                                },
                                child: Text('Log in',
                                    style: tcb25(rang: Colors.purple))),
                          ),
                        )
                      ],
                    )

                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
