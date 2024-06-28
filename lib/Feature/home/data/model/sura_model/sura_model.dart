import 'ayat_model.dart';

class SuraModel {
  int? nomor;
  String? audio;
  List<AyatModel>? ayat;

  SuraModel({
    this.nomor,
    this.audio,
    this.ayat,
  });

  factory SuraModel.fromJson(Map<String, dynamic> json) => SuraModel(
        nomor: json['nomor'] as int?,
        audio: json['audio'] as String?,
        ayat: (json['ayat'] as List<dynamic>?)
            ?.map((e) => AyatModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'nomor': nomor,
        'audio': audio,
        'ayat': ayat?.map((e) => e.toJson()).toList(),
      };
}
