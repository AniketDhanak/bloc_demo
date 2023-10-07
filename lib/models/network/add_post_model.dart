// To parse this JSON data, do
//
//     final addPostRequestModel = addPostRequestModelFromJson(jsonString);

import 'dart:convert';

AddPostRequestModel addPostRequestModelFromJson(String str) => AddPostRequestModel.fromJson(json.decode(str));

String addPostRequestModelToJson(AddPostRequestModel data) => json.encode(data.toJson());

class AddPostRequestModel {
  String title;
  String body;
  int userId;

  AddPostRequestModel({
    required this.title,
    required this.body,
    required this.userId,
  });

  factory AddPostRequestModel.fromJson(Map<String, dynamic> json) => AddPostRequestModel(
    title: json["title"],
    body: json["body"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
    "userId": userId,
  };
}

// To parse this JSON data, do
//
//     final addPostResponseModel = addPostResponseModelFromJson(jsonString);


AddPostResponseModel addPostResponseModelFromJson(String str) => AddPostResponseModel.fromJson(json.decode(str));

String addPostResponseModelToJson(AddPostResponseModel data) => json.encode(data.toJson());

class AddPostResponseModel {
  String title;
  String body;
  int userId;
  int id;

  AddPostResponseModel({
    required this.title,
    required this.body,
    required this.userId,
    required this.id,
  });

  factory AddPostResponseModel.fromJson(Map<String, dynamic> json) => AddPostResponseModel(
    title: json["title"],
    body: json["body"],
    userId: json["userId"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
    "userId": userId,
    "id": id,
  };
}
