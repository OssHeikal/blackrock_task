import 'package:blackrock_task/data/models/destination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DestinationCardTile extends StatelessWidget {
  const DestinationCardTile({super.key, required this.destination});

  final DestinationModel destination;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.w,
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey),
        image: DecorationImage(image: NetworkImage(destination.imageUrl), fit: BoxFit.cover),
      ),
      child: Text(
        destination.title,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
