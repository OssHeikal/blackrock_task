import 'package:blackrock_task/data/models/travel_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedStayCard extends StatelessWidget {
  const FeaturedStayCard({super.key, required this.stay});

  final TravelModel stay;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(stay.imageUrl, height: 0.65.sh, fit: BoxFit.cover),
        Positioned.fill(child: Container(color: Colors.black.withOpacity(0.4))),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.fromLTRB(16.w, 32.h, 16.w, 32.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 0.6.sw,
                  child: Text(
                    stay.title,
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                16.verticalSpace,
                SizedBox(
                  width: 0.6.sw,
                  child: Text(stay.subTitle, style: TextStyle(fontSize: 12.sp, color: Colors.white)),
                ),
                16.verticalSpace,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
                  onPressed: () {},
                  child: Text(stay.buttonTitle),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
