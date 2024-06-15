import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hafiz_app/Feature/home/data/model/chapter.dart';
import 'package:hafiz_app/Feature/home/data/repository/sura_repository.dart';
import 'package:hafiz_app/core/api/api_endpoints.dart';
import 'package:hafiz_app/core/api/dio_helper.dart';
import 'package:hafiz_app/core/errors/failure.dart';

class SureRepositoryImplementation implements SuraRepository {
  @override
  Future<Either<Failure, List<AyatModel>>> fetchAyatSura(
      {required int suraId}) async {
    try {
      List<AyatModel> ayat = [];
      Response response = await DioService.getData(
          url: '${ApiEndpoints.suraChapters}$suraId.json');
      for (var aya in response.data['chapter']) {
        ayat.add(AyatModel.fromJson(aya));
      }
      return Right(ayat);
    } catch (error) {
      return Left(Failure(errorMessage: error.toString()));
    }
  }
}
