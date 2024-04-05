import 'dart:convert';

List<ImageResponse> imageResponseFromJson(String str) => List<ImageResponse>.from(json.decode(str).map((x) => ImageResponse.fromJson(x)));

String imageResponseToJson(List<ImageResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageResponse {
  final String id;
  final AlternativeSlugs alternativeSlugs;
  final String altDescription;
  final Urls urls;

  ImageResponse({
    required this.id,
    required this.altDescription,
    required this.alternativeSlugs,
    required this.urls,
  });

  ImageResponse copyWith({
    String? id,
    String? altDescription,
    AlternativeSlugs? alternativeSlugs,
    Urls? urls,
  }) =>
      ImageResponse(
        id: id ?? this.id,
        altDescription: altDescription ?? this.altDescription,
        urls: urls ?? this.urls,
        alternativeSlugs: alternativeSlugs ?? this.alternativeSlugs,
      );

  factory ImageResponse.fromJson(Map<String, dynamic> json) => ImageResponse(
        id: json["id"],
        altDescription: json["alt_description"],
        alternativeSlugs: AlternativeSlugs.fromJson(json["alternative_slugs"]),
        urls: Urls.fromJson(json["urls"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alt_description": altDescription,
        "alternative_slugs": alternativeSlugs,
        "urls": urls.toJson(),
      };
}

class Urls {
  final String full;

  Urls({
    required this.full,
  });

  Urls copyWith({
    String? full,
  }) =>
      Urls(
        full: full ?? this.full,
      );

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        full: json["full"],
      );

  Map<String, dynamic> toJson() => {
        "full": full,
      };
}

class AlternativeSlugs {
  final String es;

  AlternativeSlugs({
    required this.es,
  });

  AlternativeSlugs copyWith({
    String? es,
  }) =>
      AlternativeSlugs(
        es: es ?? this.es,
      );

  factory AlternativeSlugs.fromJson(Map<String, dynamic> json) => AlternativeSlugs(
        es: json["es"].toString().replaceAll("-", " "),
      );

  Map<String, dynamic> toJson() => {
        "es": es,
      };
}
