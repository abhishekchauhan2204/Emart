import 'package:emart/consts/consts.dart';

Widget bgwidget ({Widget ? child}){
  return Container(width: double.infinity,height: double.infinity,
    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imgBackground),fit:BoxFit.fill,)),
    child: child
  );
}