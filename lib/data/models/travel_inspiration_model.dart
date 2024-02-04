import 'destination_list_model.dart';
import 'featured_destination_model.dart';
import 'featured_stay_model.dart';

TravelInspirationModel travelInspirationFromJson(Map<String, dynamic> json) {
  return TravelInspirationModel.fromJson(json);
}

class TravelInspirationModel {
  List<FeaturedStayModel> featuredStays;
  List<DestinationListModel> destinationLists;
  List<FeaturedDestinationModel> featuredDestination;

  TravelInspirationModel({
    required this.featuredStays,
    required this.destinationLists,
    required this.featuredDestination,
  });

  factory TravelInspirationModel.fromJson(Map<String, dynamic> json) {
    return TravelInspirationModel(
      featuredStays: featuredStaysFromJson(json),
      destinationLists: destinationListsFromJson(json),
      featuredDestination: featuredDestinationFromJson(json),
    );
  }
}
