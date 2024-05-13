import 'package:emart/Ui_helper/textstyle.dart';
import 'package:emart/consts/consts.dart';



customalertbox(BuildContext context,String text,Function onDismiss){
  return showDialog(context: context, builder: (context) {
    return AlertDialog(title: Text(text),actions: [ElevatedButton(onPressed: () {
      onDismiss();
      Navigator.pop(context);
    }, child: Text("OK",style: tb25(),))],);
  },);
}

