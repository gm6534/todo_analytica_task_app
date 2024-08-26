import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_styles/app_text_styles.dart';
import 'asset_image_view.dart';

class CustomItemCard extends StatelessWidget {
  final bool isColumn;
  final double? fontSize;
  final String imagePath;
  final String? title;
  const CustomItemCard(
      {super.key,
      this.isColumn = false,
      this.fontSize,
      this.imagePath = "",
      this.title});

  @override
  Widget build(BuildContext context) {
    final List<Widget> banner = [
      Expanded(
        child: AssetImageView(
          imagePath: imagePath,
          width: isColumn ? 55.w : null,
          color: Theme.of(context).primaryColor,
        ),
      ),
      FittedBox(
        child: Text(
          title ?? "",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.boldTextStyle(
            size: 15.sp,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    ];
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.0, 0.8],
                colors: [Theme.of(context).primaryColor, Colors.transparent])),
        child: Container(
          margin:
              const EdgeInsets.only(top: 0, left: 1.5, right: 1.5, bottom: 2),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3), // Shadow color
                spreadRadius: 0.2,
                blurRadius: 3,
                offset: const Offset(0, 2), // Shadow offset
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: isColumn
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: banner,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: banner,
                  ),
          ),
        ),
      ),
    );
  }
}
