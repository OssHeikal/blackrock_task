import 'package:equatable/equatable.dart';

List<FeaturedStayModel> featuredStaysFromJson(dynamic json) {
  return (json['travel_inspiration'] as List)
      .where((item) => item['type'] == 'featured_stays')
      .map((item) => FeaturedStayModel.fromJson(item))
      .toList();
}

class FeaturedStayModel extends Equatable {
  final int id;
  final int sequence;
  final String type;
  final String imageUrl;
  final String title;
  final String subTitle;
  final String buttonTitle;

  const FeaturedStayModel({
    required this.id,
    required this.sequence,
    required this.type,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.buttonTitle,
  });

  factory FeaturedStayModel.fromJson(Map<String, dynamic> json) {
    return FeaturedStayModel(
      id: json['id'],
      sequence: json['sequence'],
      type: json['type'],
      imageUrl: json['image_url'],
      title: json['title'],
      subTitle: json['sub_title'],
      buttonTitle: json['button_title'],
    );
  }

  @override
  List<Object?> get props => [id, sequence, type, imageUrl, title, subTitle, buttonTitle];
}
