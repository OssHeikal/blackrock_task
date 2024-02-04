import 'package:blackrock_task/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JoinNowCard extends StatelessWidget {
  const JoinNowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200.h,
      child: Stack(
        children: [
          Row(
            children: [
              Flexible(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  margin: EdgeInsets.only(left: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Are you a member?', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                      8.verticalSpace,
                      SizedBox(
                        width: 0.5.sw,
                        child: Text('Price dope the moment you sign up as a Tripstick member',
                            style: TextStyle(fontSize: 14.sp)),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          foregroundColor: const MaterialStatePropertyAll(Colors.white),
                          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w)),
                          backgroundColor: const MaterialStatePropertyAll(Colors.black),
                        ),
                        child: Text('Join Now', style: TextStyle(fontSize: 14.sp)),
                      ),
                    ],
                  ),
                ),
              ),
              16.horizontalSpace,
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(right: 8.0.w),
              child: Image.asset(ImagesAssets.womanImage, width: 120.w),
            ),
          ),
        ],
      ),
    );
  }
}
