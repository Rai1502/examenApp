// To parse this JSON data, do
//
//     final newsResponse = newsResponseFromMap(jsonString);

import 'dart:convert';

import 'package:examen_app/src/models/models.dart';

class NewsResponse {
  NewsResponse({
    required this.listaNoticias,
    required this.path,
    required this.codRet,
    required this.message,
  });

  List<Noticias> listaNoticias;
  String path;
  int codRet;
  String message;

  factory NewsResponse.fromJson(String str) =>
      NewsResponse.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory NewsResponse.fromMap(Map<String, dynamic> json) => NewsResponse(
        listaNoticias: List<Noticias>.from(
            json["ListaNoticias"].map((x) => Noticias.fromMap(x))),
        path: json["Path"],
        codRet: json["CodRet"],
        message: json["Message"],
      );

  // Map<String, dynamic> toMap() => {
  //     "ListaNoticias": List<dynamic>.from(listaNoticias.map((x) => x.toMap())),
  //     "Path": path,
  //     "CodRet": codRet,
  //     "Message": message,
  // };
}
