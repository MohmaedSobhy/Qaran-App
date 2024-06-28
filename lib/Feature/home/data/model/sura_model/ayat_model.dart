class AyatModel {
  int? id;
  int? surah;
  int? nomor;
  String? ar;
  String? tr;
  String? idn;

  AyatModel({this.id, this.surah, this.nomor, this.ar, this.tr, this.idn});

  factory AyatModel.fromJson(Map<String, dynamic> json) => AyatModel(
        id: json['id'] as int?,
        surah: json['surah'] as int?,
        nomor: json['nomor'] as int?,
        ar: json['ar'] as String?,
        tr: json['tr'] as String?,
        idn: json['idn'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'surah': surah,
        'nomor': nomor,
        'ar': ar,
        'tr': tr,
        'idn': idn,
      };
}
