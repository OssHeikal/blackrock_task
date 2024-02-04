import 'package:blackrock_task/data/models/destination_model.dart';
import 'package:equatable/equatable.dart';

List<DestinationListModel> destinationListsFromJson(dynamic json) {
  return (json['travel_inspiration'] as List)
      .where((item) => item['type'] == 'destination_list')
      .map((item) => DestinationListModel.fromJson(item))
      .toList();
}

class DestinationListModel extends Equatable {
  final int id;
  final int sequence;
  final String type;
  final String imageUrl;
  final String title;
  final String subTitle;
  final List<DestinationModel> list;

  const DestinationListModel({
    required this.id,
    required this.sequence,
    required this.type,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.list,
  });

  factory DestinationListModel.fromJson(Map<String, dynamic> json) {
    return DestinationListModel(
      id: json['id'],
      sequence: json['sequence'],
      type: json['type'],
      imageUrl: json['image_url'],
      title: json['title'],
      subTitle: json['sub_title'],
      list: List<DestinationModel>.from(json['list'].map((item) => DestinationModel.fromJson(item))),
    );
  }

  @override
  List<Object?> get props => [id, sequence, type, imageUrl, title, subTitle, list];
}
