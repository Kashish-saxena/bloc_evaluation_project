// To parse this JSON data, do
//
//     final signUpResponseModel = signUpResponseModelFromJson(jsonString);

import 'dart:convert';

List<SignUpResponseModel> signUpResponseModelFromJson(String str) => List<SignUpResponseModel>.from(json.decode(str).map((x) => SignUpResponseModel.fromJson(x)));

String signUpResponseModelToJson(List<SignUpResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SignUpResponseModel {
    int? id;
    String? name;
    String? email;
    String? gender;
    String? status;

    SignUpResponseModel({
        this.id,
        this.name,
        this.email,
        this.gender,
        this.status,
    });

    factory SignUpResponseModel.fromJson(Map<String, dynamic> json) => SignUpResponseModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
    };
}
