import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/routing/routes.dart';
import 'package:b2b/core/theme/colors.dart';
import 'package:b2b/modules/auth/ui/screens/login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:b2b/core/helpers/spacing.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:b2b/modules/auth/ui/widgets/app_text.dart';
import 'package:b2b/modules/auth/ui/widgets/auth_button.dart';
import 'package:b2b/modules/auth/ui/widgets/auth_container.dart';
import 'package:b2b/modules/auth/ui/widgets/auth_logo_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManegar.scaffoldColor,
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed:(){context.pop();},icon: Icon(Icons.arrow_back,color: ColorsManegar.blac,size: 30,)),
                horizontalSpace(20.w),
                Text('انشاء حساب جديد',style: TextStyles.font18Bold,),
              ],
            ),
            AuthLogoContainer(),
            Text('Smart Orderانضم الى الشبكة',style: TextStyles.font12w600,),
            verticalSpace(20.h),
            Text('نوع الحساب',textAlign: TextAlign.left,style: TextStyles.font12normal,),
            Row(children: [
              AuthContainer(icon: Icons.store_mall_directory_outlined, text: 'متجر', color: ColorsManegar.scaffoldColor),
              AuthContainer(icon: Icons.fire_truck_outlined, text: 'مورد', color: ColorsManegar.scaffoldColor),
            ],),
            AppTextField(label: 'اسم المتجر', hint: 'مثال:متجر الاسرة', controller: TextEditingController()),
            verticalSpace(20.h),
            AppTextField(label: 'البريد الالكتروني', hint: 'مثال:example@email.com', controller: TextEditingController()),
            verticalSpace(20.h),
            AppTextField(label: 'رقم الهاتف', hint: '+966XXXXXXXXX', controller: TextEditingController()),
             verticalSpace(20.h),
            AppTextField(label: 'كلمة المرور', hint: '.......', controller: TextEditingController()),
             verticalSpace(20.h),
            AppTextField(label: 'تأكيد كلمة المرور', hint: '.......', controller: TextEditingController()),
             verticalSpace(20.h),
             AuthButton(),
              verticalSpace(20.h),
              Row(
                children: [
                  Text('لديك حساب بالفعل؟',style: TextStyles.font12w600,),
                  TextButton(onPressed: (){context.pushNamed(Routes.loginScreen);}, child: Text('تسجيل الدخول',style: TextStyles.font12w600.copyWith(color: ColorsManegar.blue),))
                ],
              )
            ],
      
            ),
      ),
    ),

      
    
    );
  }
}