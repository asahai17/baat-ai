import 'dart:convert';

StatusModel statusModelFromJson(String str) =>
    StatusModel.fromJson(json.decode(str));

String statusModelToJson(StatusModel data) => json.encode(data.toJson());

class StatusModel {
  int? id;
  String? name;
  String? imgurl;

  StatusModel({
    this.id,
    this.name,
    this.imgurl,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        id: json["id"],
        name: json["name"],
        imgurl: json["imgurl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imgurl": imgurl,
      };
}
