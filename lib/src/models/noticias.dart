import 'dart:convert';

class Noticias {
  Noticias({
    required this.id,
    this.status,
    this.urlImagen,
    this.titulo,
    this.texto,
    this.urlWeb,
    this.urlVideo,
    this.width,
    this.height,
    this.expDate,
  });

  int id;
  String? status;
  String? urlImagen;
  String? titulo;
  String? texto;
  String? urlWeb;
  String? urlVideo;
  int? width;
  int? height;
  String? expDate;

  //función para armar la url de las fotos del json
  get fullImagePath {
    if (urlImagen != null) {
      return "https://cencelgo.s3.amazonaws.com/newsPath/${this.urlImagen}";
    }

    return "https://i.stack.imgur.com/GNhxO.png";
  }

  factory Noticias.fromJson(String str) => Noticias.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Noticias.fromMap(Map<String, dynamic> json) => Noticias(
        id: json["Id"],
        status: json["Status"],
        urlImagen: json["UrlImagen"],
        titulo: json["Titulo"],
        texto: json["Texto"],
        urlWeb: json["UrlWeb"],
        urlVideo: json["UrlVideo"],
        width: json["Width"],
        height: json["Height"],
        expDate: json["ExpDate"],
      );

  Map<String, dynamic> toMap() => {
        "Id": id,
        "Status": status,
        "UrlImagen": urlImagen,
        "Titulo": titulo,
        "Texto": texto,
        "UrlWeb": urlWeb,
        "UrlVideo": urlVideo,
        "Width": width,
        "Height": height,
        "ExpDate": expDate,
      };
}
