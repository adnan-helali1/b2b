// import 'package:b2b/core/helpers/spacing.dart';
// import 'package:b2b/core/theme/textstyles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AppTitleAppbar extends StatelessWidget {
//   const AppTitleAppbar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cs = Theme.of(context).colorScheme;

//     return Row(
//       children: [
//         // Icon container
//         Container(
//           width: 40.w,
//           height: 40.h,
//           decoration: BoxDecoration(
//             color: cs.primary.withOpacity(0.12), // ✅ FIXED
//             shape: BoxShape.circle,
//           ),
//           child: Icon(
//             Icons.shopping_cart_outlined,
//             color: cs.primary, // ✅ FIXED
//             size: 20,
//           ),
//         ),

//         horizontalSpace(10),

//         // Title + subtitle
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'متجر الأسرة',
//               style: TextStyles.font18Bold.copyWith(
//                 color: cs.onSurface, // ✅ FIXED
//               ),
//             ),
//             Text(
//               'سوبر ماركت',
//               style: TextStyles.font12.copyWith(
//                 color: cs.onSurfaceVariant, // ✅ FIXED
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
