import 'package:dartz/dartz.dart';
import 'package:hafiz_app/Feature/home/data/model/chapter.dart';
import 'package:hafiz_app/core/errors/failure.dart';

abstract class SuraRepository {
  Future<Either<Failure, List<AyatModel>>> fetchAyatSura({required int suraId});
}
