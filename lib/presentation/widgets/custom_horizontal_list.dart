import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHorizontalList extends StatelessWidget {
  const CustomHorizontalList({
    super.key,
    this.height = 160,
    required this.itemBuilder,
    required this.itemCount,
  });

  final double height;
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: ListView.separated(
        itemCount: itemCount,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => 16.horizontalSpace,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
