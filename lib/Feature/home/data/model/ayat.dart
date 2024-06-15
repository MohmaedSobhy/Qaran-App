class AyatModel {
  int? chapter;
  int? verse;
  String? text;

  AyatModel({this.chapter, this.verse, this.text});

  factory AyatModel.fromJson(Map<String, dynamic> json) => AyatModel(
        chapter: json['chapter'] as int?,
        verse: json['verse'] as int?,
        text: json['text'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'chapter': chapter,
        'verse': verse,
        'text': text,
      };
}
