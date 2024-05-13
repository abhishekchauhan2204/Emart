import 'package:emart/consts/consts.dart';


Widget apxx(){
  return  Container(
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 1,
            blurStyle: BlurStyle.inner,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)),
    alignment: Alignment.center,
    height: 95,
    width: 95,
    child:Container(
      height: 100,
      width: 100,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Image.asset(icAppLogo),)
  );
}