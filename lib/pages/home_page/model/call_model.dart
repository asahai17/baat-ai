import 'dart:convert';

class CallModel {
  int? id;
  String? name;
  String? callType;
  String? callTime;
  String? callDirection;
  String? image;

  CallModel({
    this.id,
    this.name,
    this.callType,
    this.callTime,
    this.callDirection,
    this.image,
  });

  factory CallModel.fromRawJson(String str) =>
      CallModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CallModel.fromJson(Map<String, dynamic> json) => CallModel(
        id: json["id"],
        name: json["name"],
        callType: json["callType"],
        callTime: json["callTime"],
        callDirection: json["call_direction"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "callType": callType,
        "callTime": callTime,
        "call_direction": callDirection,
        "image": image,
      };
}
