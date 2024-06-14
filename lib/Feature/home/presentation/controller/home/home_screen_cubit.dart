import 'package:bloc/bloc.dart';
import 'package:hafiz_app/core/helper/storage_helper.dart';
import 'package:meta/meta.dart';
part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit._() : super(HomeScreenInitial());

  static HomeScreenCubit instanse = HomeScreenCubit._();

  int lastSuraId = 0;
  String lastReadkey = 'lastRead';

  void checkLastSuraRead() async {
    dynamic value = await StorageHelper.get(key: lastReadkey);
    lastSuraId = (value == null) ? 0 : value;
  }

  void onPresedSuraItem({required int suraId}) async {
    await StorageHelper.put(key: lastReadkey, value: suraId);
    lastSuraId = suraId;
    emit(LastSuraReadVisible());
  }
}
