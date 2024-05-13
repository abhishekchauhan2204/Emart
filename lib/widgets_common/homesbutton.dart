import 'package:emart/Ui_helper/textstyle.dart';
import 'package:emart/consts/consts.dart';

Widget homebutton(icon, {width, height, String? title, onpress}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(color: Colors.black, blurRadius: 4, blurStyle: BlurStyle.outer),
    ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(icon),
      SizedBox(
        height: 8,
      ),
      if (title != null) Text(title)
    ]),
  );
}
//homebutton1
Widget homebutton1({width, height, title, icon, oncover}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 4, blurStyle: BlurStyle.outer, color: Colors.black)
        ]),
    alignment: Alignment.center,
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      if (icon != null) Image.asset(icon),
      SizedBox(
        height: 4,
      ),
      if (title != null)
        Text(
          title,
          style: tb20(),
        )
    ]),
  );
}
// featuredbutton
Widget featuredbutton({icon, required String title}) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
        color: Colors.black,
        blurRadius: 3,
      )
    ]),
    width: 210,
    padding: EdgeInsets.all(4),
    margin: EdgeInsets.all(5),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 70,
            width: 70,
            fit: BoxFit.fill,
          ),
          Text(
            textAlign: TextAlign.center,
            title,
            style: tb20(),
          )
        ]),
  );
}
//featured products
Widget featuredproducts({height, width,String? title1, String ?title2,icon}) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(4),
    margin: EdgeInsets.all(4),
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 3)]),
    child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Image.asset(icon,height: 150,width: 150,fit: BoxFit.fill,), Text(title1!,style: tb20(),),if(title2!=null)Text(title2,style: tb20(),),]),
  );
}
