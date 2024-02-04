import 'package:blackrock_task/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/enums.dart';
import '../../utils/service_locator.dart';
import '../controller/cubit/home_cubit.dart';
import '../widgets/destination_list_card.dart';
import '../widgets/featured_stay_card.dart';
import '../widgets/home_screen.dart';
import '../widgets/icon_text_card_tile.dart';
import '../widgets/join_now_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..getTravelInspiration(),
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 16.w),
            child: Column(
              children: [
                const HomeAppBar(),
                32.verticalSpace,
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case CubitStatus.loading:
                        return const Center(child: CupertinoActivityIndicator());
                      case CubitStatus.error:
                        return Center(child: Text(state.message));
                      case CubitStatus.loaded:
                        return Column(
                          children: [
                            Container(
                              height: 160.h,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                children: [
                                  const IconTextCardTile(
                                    icon: CupertinoIcons.globe,
                                    title: 'Travel Inspiration',
                                    color: Colors.blue,
                                  ),
                                  16.horizontalSpace,
                                  const IconTextCardTile(
                                    icon: CupertinoIcons.question_circle_fill,
                                    title: 'Why Choose tripstick?',
                                    color: Colors.orange,
                                  ),
                                ],
                              ),
                            ),
                            32.verticalSpace,
                            const JoinNowCard(),
                            32.verticalSpace,
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.travelModel.length,
                              separatorBuilder: (context, index) => 24.verticalSpace,
                              itemBuilder: (context, index) {
                                final TravelItemType type = state.travelModel[index].type;
                                switch (type) {
                                  case TravelItemType.featuredStays:
                                    return FeaturedStayCard(stay: state.travelModel[index]);
                                  case TravelItemType.destinationList:
                                    return DestinationListCard(destinationList: state.travelModel[index]);
                                  case TravelItemType.featuredDestination:
                                    return FeaturedStayCard(stay: state.travelModel[index]);
                                }
                              },
                            ),
                          ],
                        );
                      default:
                        return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: AppConstants.kMainColor,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontSize: 12.sp, color: Colors.red),
      unselectedLabelStyle: TextStyle(fontSize: 12.sp, color: Colors.black),
      items: const [
        BottomNavigationBarItem(icon: BottomNavBarIcon(icon: CupertinoIcons.house), label: 'Home'),
        BottomNavigationBarItem(icon: BottomNavBarIcon(icon: CupertinoIcons.compass), label: 'Explore'),
        BottomNavigationBarItem(icon: BottomNavBarIcon(icon: CupertinoIcons.bag), label: 'Trips'),
        BottomNavigationBarItem(icon: BottomNavBarIcon(icon: CupertinoIcons.share), label: 'Share'),
        BottomNavigationBarItem(icon: BottomNavBarIcon(icon: CupertinoIcons.person), label: 'Account'),
      ],
    );
  }
}

class BottomNavBarIcon extends StatelessWidget {
  const BottomNavBarIcon({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(bottom: 8.w), child: Icon(icon, size: 24.sp));
  }
}
