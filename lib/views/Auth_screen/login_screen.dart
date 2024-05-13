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

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
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
          usercredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password)
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
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imgBackground), fit: BoxFit.fill)),
          child: Stack(children: [
            SafeArea(
              child: Center(
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
                      'Login to Emart',
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
                              'Login',
                              style: tb25(),
                            )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("don't have a account", style: tb20()),
                            SizedBox(
                              width: 15,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => signup(),
                                    ));
                              },
                              child: Text('Sign up',
                                  style: tcb25(rang: Colors.purple)),
                            )
                          ],
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Reset Password',
                              style: tcb25(rang: Colors.purple),
                            )),
                        Text(
                          'Login with',
                          style: tb25(),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                3,
                                    (index) =>
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        child: Image.asset(soicallogo[index]),
                                      ),
                                    ))),
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
