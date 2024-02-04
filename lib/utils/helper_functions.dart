import 'package:blackrock_task/utils/enums.dart';

class HelperFunction {
  static TravelItemType getTravelItemType(String type) {
    switch (type) {
      case 'featured_stays':
        return TravelItemType.featuredStays;
      case 'destination_list':
        return TravelItemType.destinationList;
      case 'featured_destination':
        return TravelItemType.featuredDestination;
      default:
        return TravelItemType.featuredStays;
    }
  }
}
