import 'package:equatable/equatable.dart';

List<DestinationModel> destinationFromJson(dynamic json) {
  return List<DestinationModel>.from(json['list'].map((item) => DestinationModel.fromJson(item)));
}

class DestinationModel extends Equatable {
  final int cityId;
  final String title;
  final String subTitle;
  final String imageUrl;

  const DestinationModel({
    required this.cityId,
    required this.title,
    required this.subTitle,
    required this.imageUrl,
  });

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
      cityId: json['city_id'],
      title: json['title'],
      subTitle: json['sub_title'],
      imageUrl: json['image_url'],
    );
  }

  @override
  List<Object?> get props => [cityId, title, subTitle, imageUrl];
}
