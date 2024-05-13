import 'dart:io';

import 'package:emart/Controller/profilecontroller.dart';
import 'package:emart/Ui_helper/textstyle.dart';
import 'package:emart/views/homescreen/home.dart';
import 'package:emart/views/profile%20screen/profile%20screen.dart';
import 'package:emart/widgets_common/bg_widgets.dart';
import 'package:emart/widgets_common/prac_text.dart';
import 'package:image_picker/image_picker.dart';

import '../../consts/consts.dart';
import '../../consts/profile list.dart';

class editbuttonprofile extends StatefulWidget {

  editbuttonprofile({super.key, });

  @override
  State<editbuttonprofile> createState() => _editbuttonprofileState();
}

class _editbuttonprofileState extends State<editbuttonprofile> {
  var name = TextEditingController();
  var email = TextEditingController();

  callback(){

  }

  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return bgwidget(
        child: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: true,
            centerTitle: true),
        body: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 1)]),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _image == null
                          ? CircleAvatar(
                              backgroundImage: AssetImage(imgProfile2),
                              radius: 70,
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 70,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child: Image.file(
                                    _image!,
                                    fit: BoxFit.fill,height: 150,
                                  )),
                            ),
                      ElevatedButton(
                        onPressed: () {
                          _pickImage(ImageSource.gallery);
                        },
                        child: Text('Pick Image from Gallery'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
          
                  SizedBox(
                    height: 10,
                  ),
                  custextfield(name, false, "name"),
                  SizedBox(
                    height: 10,
                  ),
                  custextfield(email, false, "email"),
                  SizedBox(
                    height: 10,
                  ),
                  //save
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.redAccent.withBrightness)),
                      onPressed: () {
                       setState(() {
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                           return home();
                         },));


                         profilelist = [name.text.toString(),email.text.toString()];
                       });
                      },
                      child: Text(
                        "Save",
                        style: tb25(),
                      ))
                ],
              )),
        ),
      ),
    ));
  }
}
