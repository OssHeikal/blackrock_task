import 'package:equatable/equatable.dart';

import '../../utils/enums.dart';
import '../../utils/helper_functions.dart';
import 'destination_model.dart';

List<TravelModel> travelItemsFromJson(dynamic json) {
  return (json['travel_inspiration'] as List).map((item) => TravelModel.fromJson(item)).toList();
}

class TravelModel extends Equatable {
  final int id;
  final int sequence;
  final TravelItemType type;
  final String imageUrl;
  final String title;
  final String subTitle;
  final String buttonTitle;
  final List<DestinationModel> list;

  const TravelModel({
    required this.id,
    required this.sequence,
    required this.type,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.buttonTitle,
    required this.list,
  });

  factory TravelModel.fromJson(Map<String, dynamic> json) {
    return TravelModel(
      id: json['id'],
      sequence: json['sequence'],
      type: HelperFunction.getTravelItemType(json['type']),
      imageUrl: json['image_url'] ?? '',
      title: json['title'],
      subTitle: json['sub_title'],
      buttonTitle: json['button_title'] ?? '',
      list: json['list'] != null ? destinationFromJson(json) : [],
    );
  }

  const TravelModel.empty()
      : id = 0,
        sequence = 0,
        type = TravelItemType.featuredStays,
        imageUrl = '',
        title = '',
        subTitle = '',
        buttonTitle = '',
        list = const [];

  @override
  List<Object?> get props => [id, sequence, type, imageUrl, title, subTitle, buttonTitle, list];
}

List<DestinationModel> destinationFromJson(Map<String, dynamic> json) {
  return List<DestinationModel>.from(
    json['list'].map((item) => DestinationModel.fromJson(item)),
  );
}
