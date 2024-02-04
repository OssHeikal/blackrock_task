import 'package:blackrock_task/data/models/destination_model.dart';
import 'package:blackrock_task/data/models/travel_model.dart';
import 'package:blackrock_task/presentation/widgets/custom_horizontal_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'destination_card_tile.dart';

class DestinationListCard extends StatelessWidget {
  const DestinationListCard({super.key, required this.destinationList});

  final TravelModel destinationList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: SizedBox(
            width: 0.7.sw,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(destinationList.title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                4.verticalSpace,
                Text(destinationList.subTitle, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),
        16.verticalSpace,
        SizedBox(
          height: 200.h,
          child: CustomHorizontalList(
            itemCount: destinationList.list.length,
            itemBuilder: (context, index) {
              final DestinationModel destination = destinationList.list[index];
              return DestinationCardTile(destination: destination);
            },
          ),
        ),
      ],
    );
  }
}
