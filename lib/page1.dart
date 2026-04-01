

// import 'package:b2b/core/helpers/spacing.dart';
// import 'package:b2b/core/theme/colors.dart';
// import 'package:b2b/core/theme/textstyles.dart';
// import 'package:b2b/core/theme/widgets.dart';
// import 'package:flutter/material.dart';



// class Page1 extends StatefulWidget {
//    Page1({super.key});

//   @override
//   State<Page1> createState() => _Page1State();
// }

// class _Page1State extends State<Page1>{
// late TextEditingController emailController;
// late TextEditingController passwordController; 
 
//   @override
//   void initState() {
//     super.initState();
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//   }
//   @override
//   void dispose(){
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorsManegar.scaffoldColor,
//       body: SingleChildScrollView(
        
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 Container1(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorsManegar.grey), width: 100, height: 100,   
//                 conchild: iconnew(icon: 
//                 Icons.shopping_cart, size: 20, iconcolor: ColorsManegar.darkMove, borderRadius: 10,)
//                 ),
//             Text1(text: 'Smart Order', style: TextStyles.font18BlackBold),
//                  Text1(text: 'نظام الطلبات الذكي B2B', style: TextStyles.font18greyw600),
//                  Text1(text: 'اختر نوع الحساب', style: TextStyles.font12GreyW600),
//                  verticalSpace(30),
//                   Row(
//                            children: [
//                            Container1(width: 100, height: 100, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorsManegar.grey),  conchild: Column(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:  [iconnew(icon: Icons.store_mall_directory_outlined, size:20, iconcolor: ColorsManegar.backgroundIcon, borderRadius: 10,),
//                            Text1(text: 'متجر', style: TextStyles.font12GreyW600),],)),
//                            horizontalSpace(10),
//                            Container1(width: 100, height: 100, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorsManegar.grey),  conchild: Column(children: [iconnew(icon: Icons.directions_car_filled_outlined, size:20, iconcolor: ColorsManegar.backgroundIcon, borderRadius: 10,),
//                            Text1(text: 'مورد', style: TextStyles.font12GreyW600),],)),
//                             horizontalSpace(10),
//                            Container1(width: 100, height: 100, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorsManegar.grey),  conchild: Column(children: [iconnew(icon: Icons.admin_panel_settings_sharp, size:20, iconcolor: ColorsManegar.backgroundIcon, borderRadius: 10,),
//                            Text1(text: 'مدير النظام', style: TextStyles.font12GreyW600),],)),     ],),
//                 verticalSpace(30),
//             Container1(width: double.infinity, height: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorsManegar.grey),  conchild:Center(child: Text1(text: 'ادارة الطلبات و المخزون', style: TextStyles.font12GreyW600)) ,),
//             verticalSpace(30),
//             Form1(lable: 'البريد الالكتروني', hint: 'example@company.com',border:OutlineInputBorder( borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: ColorsManegar.grey600)), controller: emailController, validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your email';
//               }
//               if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
//                 return 'Please enter a valid email';
//               }
//               return null;
//             }),
//             verticalSpace(30),
//             Form1(lable: 'كلمة المرور', hint: 'Enter your password',border:OutlineInputBorder( borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: ColorsManegar.grey600)), controller: passwordController, validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your password';
//               }
//               if (value.length < 6) {
//                 return 'Please enter a valid password';
//               }
//               return null;
//             }),
//             verticalSpace(30),
//             TextButton(onPressed: (){}, child: Text1(text: 'نسيت كلمة المرور؟', style: TextStyle(color: ColorsManegar.blue,fontSize: 12,))),
//                      verticalSpace(30),
//             TextButton(onPressed: (){}, child: Container1(width: double.infinity, height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorsManegar.darkMove), conchild: Center(child: Text1(text:'تسجيل الدخول', style: TextStyles.font12Grey)))),
//                      verticalSpace(30),
//             Row(children: [
//               TextButton(onPressed: (){}, child: Text1( text: 'تسجيل الدخول', style: TextStyle(color: ColorsManegar.blue,fontSize: 12,))),
//               Text1(text: 'انشاء حساب جديد', style: TextStyles.font12GreyW600),
//             ],)
//               ],
//             ),
//           ),
//         ),
      
//     );
//   }
// }
















// import 'package:b2b/core/theme/colors.dart';
// import 'package:flutter/material.dart';
// class Form1 extends StatelessWidget {
// final String lable;
// final String hint;
// final InputBorder border;
// final TextEditingController controller;
// final String?Function (String?)? validator;
// const Form1 ({
// Key?key,
// required this.lable,
// required this.hint,
// required this.border,
// required this.controller,
// required this.validator,
// }):super(key: key);
// @override
// Widget build(BuildContext context){
//   return TextFormField(
//     controller: controller,
//     validator: validator,
//     decoration: InputDecoration(labelText: lable,
//     hintText: hint,
//     border:OutlineInputBorder( borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: ColorsManegar.grey600)
//     ),
    
//     ),
    
//   );
// }
// }
// class Container1 extends StatelessWidget{
// final double width;
// final double height;

// final BoxDecoration? decoration;

// final Widget?conchild;
// const Container1({
//   Key?key,
//   required this.width,
//   required this.height,
  
//   this.decoration,

// required this.conchild,  
// }):super(key: key);
// @override
//   Widget build(BuildContext context) {
//    return Container(
//     width:width,
//     height:height,
    
//     child: conchild,
//     decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorsManegar.grey),
    
//    );
//   }
// }
// class iconnew extends StatelessWidget{
//   final IconData icon;
//   final double size;
//   final Color iconcolor;
//   final double borderRadius;
//   const iconnew({
//     Key?key,
//     required this.icon,
//     required this.size,
//     required this.iconcolor,
//     required this.borderRadius,
//   }):super(key: key);
//   @override
//   Widget build(BuildContext context){
//     return Container(
//       width:15,
//       height:15,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
//       color: Colors.black26,
//       child: iconnew(icon: icon,size:size,iconcolor:iconcolor,borderRadius: borderRadius,),
//     );
//   }
// }
// class Text1 extends StatelessWidget{
//   final String text;
//   final TextStyle style;
//   Text1({
//     Key?key,
//     required this.text,
//     required this.style,
//   }):super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Text(text, style: style);
//   }
// }





