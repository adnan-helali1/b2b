import 'package:flutter/material.dart';
class Form1 extends StatelessWidget {
final String lable;
final String hint;
final TextEditingController controller;
final String?Function (String?)? validator;
const Form1 ({
Key?key,
required this.lable,
required this.hint,
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
    border:OutlineInputBorder(borderRadius: BorderRadius.circular(10),
    )),
  );
}
}
class Container1 extends StatelessWidget{
final double width;
final double height;
final Color color;
final String text;
final Widget?conchild;
const Container1({
  Key?key,
  required this.width,
  required this.height,
  required this.color,
required this.text,
required this.conchild,  
}):super(key: key);
@override
  Widget build(BuildContext context) {
   return Container(
    width:width,
    height:height,
    color:color,
    child: conchild,
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