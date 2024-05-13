import 'package:emart/Ui_helper/Textfield.dart';
import 'package:emart/Ui_helper/alert%20box.dart';
import 'package:emart/Ui_helper/textstyle.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/views/Auth_screen/login_screen.dart';
import 'package:emart/views/homescreen/home.dart';
import 'package:emart/widgets_common/app_logo_widgets.dart';
import 'package:emart/widgets_common/bg_widgets.dart';
import 'package:emart/widgets_common/prac_text.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup1 extends StatefulWidget {
  const signup1({super.key});

  @override
  State<signup1> createState() => _signup1State();
}

class _signup1State extends State<signup1> {
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var repass = TextEditingController();
  bool check = false;
  bool _isloading = false;

  @override
  Widget build(BuildContext context) {
    signupcredentials(String email, String password) async{
      setState(() {
        _isloading=true;
      });
      if (email == "" && password == "") {
        customalertbox(context, "please provide the Required Fields",(){setState(() {
          _isloading=false;
        });});
      } else {
        UserCredential?usercredential;
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email, password: password).then((value) =>
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => home(),)));
        } on FirebaseAuthException catch (ex) {
          customalertbox(context, ex.code.toString(), () {});
        } finally {
          setState(() {
            _isloading = false;
          });
        }
      }
    }


    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imgBackground,), fit: BoxFit.fill,)),
            child: SafeArea(
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [

                            Container(child: apxx()),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Join  Emart',
                              style: tb20(),
                            )
                          ],
                        )),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        children: [
                          //username
                          Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: custextfield(name, false, 'username',
                              )),
                          //Email
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16),
                              child: custextfield(
                                  email, false, "Email", iconData: Icons.email)
                          ),
                          //password
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: custextpass(
                                tohide: true,
                                controller: password,
                                iconData: Icons.visibility,
                                Likhde: 'password'),
                          ),
                          //repassword
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 16),
                            child: custextpass(
                                tohide: true,
                                controller: repass,
                                iconData: Icons.visibility,
                                Likhde: '******'),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //checkbox
                                Checkbox(
                                  fillColor: MaterialStatePropertyAll(
                                      Colors.red.shade400),
                                  checkColor: Colors.white,
                                  value: check,
                                  onChanged: (newvalue) {
                                    setState(() {
                                      check = !check;
                                    });
                                  },
                                ),
                                //Text
                                Wrap(
                                  direction: Axis.vertical,
                                  children: [
                                    Row(
                                      children: [
                                        Text('I agree to ', style: tb20()),
                                        Text("Terms and condition's",
                                            style: tb20(rang: Colors.orange)),
                                      ],
                                    ),
                                    Text('& Privacy policy',
                                        style: tb20(rang: Colors.orange)),
                                  ],
                                ),
                              ]),
                          //signup button
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16, left: 16, right: 16),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      check == true
                                          ? Theme
                                          .of(context)
                                          .colorScheme
                                          .inversePrimary
                                          : lightGrey),
                                ),
                                onPressed: () {
                                  signupcredentials(email.text.toString(),
                                      password.text.toString());
                                },
                                child:_isloading?CircularProgressIndicator(): Text(
                                  'Sign up',
                                  style: tb25(),
                                )),
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
                                          style: tb20(rang: Colors.orange))),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ));
  }
}
