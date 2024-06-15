import 'package:bloc/bloc.dart';
import 'package:hafiz_app/Feature/home/data/model/ayat.dart';
import 'package:hafiz_app/Feature/home/data/repository/sure_repository_implementation.dart';
import 'package:meta/meta.dart';

part 'sura_state.dart';

class SuraCubit extends Cubit<SuraState> {
  SuraCubit._() : super(SuraInitial());

  static SuraCubit instanse = SuraCubit._();

  List<AyatModel> ayat = [];

  void fetchAyatSura({required int suraId}) async {
    emit(LoadingAyatState());
    var data = await SureRepositoryImplementation.instanse
        .fetchAyatSura(suraId: suraId);

    data.fold((fail) {
      emit(FailedLoadingAyats());
    }, (ayat) {
      this.ayat.clear();
      this.ayat.addAll(ayat);
      emit(SuccessLoadingAyats());
    });
  }
}
