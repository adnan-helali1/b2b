import 'package:b2b/core/helpers/extensions.dart';
import 'package:b2b/core/theme/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuperInvoiceActionButtonsRow extends StatelessWidget {
  final VoidCallback onPreview;
  final VoidCallback onDownload;

  const SuperInvoiceActionButtonsRow({
    super.key,
    required this.onPreview,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      alignment: WrapAlignment.end,
      children: [
        SizedBox(
          width: 84.w,
          child: OutlinedButton(
            onPressed: onPreview,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              visualDensity: VisualDensity.compact,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.visibility_outlined, size: 16.sp),
                SizedBox(width: 4.w),
                Text(
                  'عرض',
                  style: TextStyles.font12w600.copyWith(
                    color: context.cs.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 84.w,
          child: FilledButton(
            onPressed: onDownload,
            style: FilledButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              visualDensity: VisualDensity.compact,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.download_outlined, size: 16.sp),
                SizedBox(width: 4.w),
                Text(
                  'تحميل',
                  style: TextStyles.font12w600.copyWith(
                    color: context.cs.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
