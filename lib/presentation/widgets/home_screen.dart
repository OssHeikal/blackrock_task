import 'package:blackrock_task/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(ImagesAssets.logo, width: 140.w),
              const Spacer(),
              const Icon(Icons.favorite_border),
              16.horizontalSpace,
              const Icon(Icons.notifications_none),
            ],
          ),
          SizedBox(height: 16.h),
          SearchBar(
            elevation: const MaterialStatePropertyAll(0),
            side: const MaterialStatePropertyAll(BorderSide(color: Colors.black)),
            hintText: 'Where to?',
            constraints: BoxConstraints(minHeight: 48.h),
            leading: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
