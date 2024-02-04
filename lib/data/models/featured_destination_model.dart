import 'package:equatable/equatable.dart';

List<FeaturedDestinationModel> featuredDestinationFromJson(dynamic json) {
  return (json['travel_inspiration'] as List)
      .where((item) => item['type'] == 'featured_destination')
      .map((item) => FeaturedDestinationModel.fromJson(item))
      .toList();
}

class FeaturedDestinationModel extends Equatable {
  final int id;
  final int did;
  final int sequence;
  final String type;
  final String imageUrl;
  final String title;
  final String subTitle;
  final String buttonTitle;

  const FeaturedDestinationModel({
    required this.id,
    required this.did,
    required this.sequence,
    required this.type,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.buttonTitle,
  });

  factory FeaturedDestinationModel.fromJson(Map<String, dynamic> json) {
    return FeaturedDestinationModel(
      id: json['id'],
      did: json['did'],
      sequence: json['sequence'],
      type: json['type'],
      imageUrl: json['image_url'],
      title: json['title'],
      subTitle: json['sub_title'],
      buttonTitle: json['button_title'],
    );
  }

  @override
  List<Object?> get props => [id, did, sequence, type, imageUrl, title, subTitle, buttonTitle];
}
