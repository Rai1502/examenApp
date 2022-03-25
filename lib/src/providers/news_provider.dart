import 'dart:convert';

import 'package:examen_app/src/models/models.dart';
import 'package:examen_app/src/models/news_response.dart';
import 'package:http/http.dart' as http;
import "package:xml/xml.dart" as xml;
import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier {
  final String _baseUrl =
      "developer.teria.mx/dev/ws/WsCencelGoDev/wscencelgo.asmx";
  final String _nameUser = "android";
  final String _password = "e10adc3949ba59abbe56e057f20f883e";
  final String _requestBody =
      """<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="https://wscencelgo.nubekcencel.teria.mx">
   <soapenv:Header>
      <wsc:AuthHeader>
         <!--Optional:-->
         <wsc:Username>android</wsc:Username>
         <!--Optional:-->
         <wsc:Password>e10adc3949ba59abbe56e057f20f883e</wsc:Password>
      </wsc:AuthHeader>
   </soapenv:Header>
   <soapenv:Body>
      <wsc:News>
         <!--Optional:-->
         <wsc:op>s</wsc:op>
         <!--Optional:-->
         <wsc:id></wsc:id>
         <!--Optional:-->
         <wsc:urlimagen></wsc:urlimagen>
         <!--Optional:-->
         <wsc:titulo></wsc:titulo>
         <!--Optional:-->
         <wsc:texto></wsc:texto>
         <!--Optional:-->
         <wsc:status></wsc:status>
         <!--Optional:-->
         <wsc:urlweb></wsc:urlweb>
         <!--Optional:-->
         <wsc:fexpira></wsc:fexpira>
         <!--Optional:-->
         <wsc:ancho></wsc:ancho>
         <!--Optional:-->
         <wsc:alto></wsc:alto>
         <!--Optional:-->
         <wsc:urlvideo></wsc:urlvideo>
      </wsc:News>
   </soapenv:Body>
</soapenv:Envelope>""";

  final _uri = Uri.parse(
      "https://developer.teria.mx/dev/ws/WsCencelGoDev/wscencelgo.asmx");

  List<Noticias> ondisplayNoticias = [];

  NewsProvider() {
    print("News Provider inicializado");
    this.getondisplayNoticias();
  }

  Future<String> _getJsonData() async {
    final http.Response response = await http.post(
      _uri,
      headers: {
        "Content-Type": "text/xml; charset=utf-8",
        "SOAPAction": "https://wscencelgo.nubekcencel.teria.mx/News",
        "Host": "developer.teria.mx"
      },
      body: _requestBody,
    );
    return response.body;
  }

  getondisplayNoticias() async {
    final responseBody = await this._getJsonData();
    final parseXml = xml.XmlDocument.parse(responseBody).innerText;
    final nowNewsResponse = NewsResponse.fromJson(parseXml);

    ondisplayNoticias = nowNewsResponse.listaNoticias;
    notifyListeners();
  }
}
