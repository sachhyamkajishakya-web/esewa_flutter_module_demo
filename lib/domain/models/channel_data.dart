import 'package:json_annotation/json_annotation.dart';

part 'channel_data.g.dart';

@JsonSerializable()
class ChannelData {
  final String? uuid;
  final String platform;
  final String environment;

  ChannelData({this.uuid, required this.platform, required this.environment});

  factory ChannelData.fromJson(Map<String, dynamic> json) =>
      _$ChannelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelDataToJson(this);
}
