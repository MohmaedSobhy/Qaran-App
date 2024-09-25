import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hafiz_app/Feature/home/data/model/sura_model/sura_model.dart';
import 'package:hafiz_app/Feature/home/data/repository/sura_repository.dart';
import 'package:hafiz_app/core/api/api_endpoints.dart';
import 'package:hafiz_app/core/api/dio_helper.dart';
import 'package:hafiz_app/core/errors/failure.dart';

class SureRepositoryImplementation implements SuraRepository {
  static SureRepositoryImplementation instanse =
      SureRepositoryImplementation._();

  SureRepositoryImplementation._();
  @override
  Future<Either<Failure, SuraModel>> fetchAyatSura(
      {required int suraId}) async {
    try {
      Response response =
          await DioService.getData(url: '${ApiEndpoints.suraChapters}$suraId');

      return Right(SuraModel.fromJson(response.data));
    } catch (error) {
      return Left(Failure(errorMessage: error.toString()));
    }
  }
}
