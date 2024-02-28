import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  int? id;
  String? name;
  bool? isGroup;
  String? lastMessage;
  String? imgurl;

  ChatModel({
    this.id,
    this.name,
    this.isGroup,
    this.lastMessage,
    this.imgurl,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json["id"],
        name: json["name"],
        isGroup: json["isGroup"],
        lastMessage: json["lastMessage"],
        imgurl: json["imgurl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isGroup": isGroup,
        "lastMessage": lastMessage,
        "imgurl": imgurl,
      };
}
