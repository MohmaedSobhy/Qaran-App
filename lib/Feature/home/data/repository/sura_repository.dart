import 'package:dartz/dartz.dart';
import 'package:hafiz_app/Feature/home/data/model/sura_model/sura_model.dart';
import 'package:hafiz_app/core/errors/failure.dart';

abstract class SuraRepository {
  Future<Either<Failure, SuraModel>> fetchAyatSura({required int suraId});
}
