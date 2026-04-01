import 'package:b2b/core/theme/colors.dart';
import 'package:flutter/material.dart';
class Form1 extends StatelessWidget {
final String lable;
final String hint;
final InputBorder border;
final TextEditingController controller;
final String?Function (String?)? validator;
const Form1 ({
Key?key,
required this.lable,
required this.hint,
required this.border,
required this.controller,
required this.validator,
}):super(key: key);
@override
Widget build(BuildContext context){
  return TextFormField(
    controller: controller,
    validator: validator,
    decoration: InputDecoration(labelText: lable,
    hintText: hint,
    border:OutlineInputBorder( borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: ColorsManegar.grey600)
    ),
    
    ),
    
  );
}
}
class Container1 extends StatelessWidget{
final double width;
final double height;

final BoxDecoration? decoration;

final Widget?conchild;
const Container1({
  Key?key,
  required this.width,
  required this.height,
  
  this.decoration,

required this.conchild,  
}):super(key: key);
@override
  Widget build(BuildContext context) {
   return Container(
    width:width,
    height:height,
    
    child: conchild,
    decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorsManegar.grey),
    
   );
  }
}
class iconnew extends StatelessWidget{
  final IconData icon;
  final double size;
  final Color iconcolor;
  final double borderRadius;
  const iconnew({
    Key?key,
    required this.icon,
    required this.size,
    required this.iconcolor,
    required this.borderRadius,
  }):super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      width:15,
      height:15,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      color: Colors.black26,
      child: iconnew(icon: icon,size:size,iconcolor:iconcolor,borderRadius: borderRadius,),
    );
  }
}
class Text1 extends StatelessWidget{
  final String text;
  final TextStyle style;
  Text1({
    Key?key,
    required this.text,
    required this.style,
  }):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: style);
  }
}