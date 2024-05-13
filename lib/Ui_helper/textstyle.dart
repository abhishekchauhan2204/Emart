import 'package:emart/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
TextStyle tb25(){
  return TextStyle(fontFamily:lobbold,fontSize: 25,color: Colors.black87,);
}
//next
TextStyle tb30(){
  return TextStyle(fontFamily:lobbold,fontSize: 30,color: Colors.black87,);
}
//next
TextStyle tb20({Color rang = Colors.black,})
{
  return TextStyle(fontSize: 20,fontFamily: lobbold,color: rang);
}
//next
TextStyle tcb25({Color rang= Colors.black}){
  return TextStyle(color: rang,fontSize: 25,fontFamily: lobbold);
}
//next
TextStyle tb15({Color rang = Colors.black}){
  return TextStyle(fontSize: 15,color: rang,fontFamily: lobbold);
}