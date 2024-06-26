import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafiz_app/Feature/home/presentation/controller/sura/sura_cubit.dart';
import 'package:hafiz_app/Feature/home/presentation/widgets/aya_list_view_item.dart';
import 'package:hafiz_app/core/styles/color/app_color.dart';
import 'package:hafiz_app/core/widgets/no_internect_connection.dart';

class SuraAyatListView extends StatelessWidget {
  const SuraAyatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuraCubit, SuraState>(
      builder: (context, state) {
        if (state is SuccessLoadingAyats) {
          return ListView.builder(
            itemCount: SuraCubit.instanse.ayat.length,
            itemBuilder: (context, index) {
              return AyaListViewItem(
                ayaTextAr: SuraCubit.instanse.ayat[index].ar!,
                ayaTextEn: SuraCubit.instanse.ayat[index].tr!,
                ayaIndex: index + 1,
              );
            },
          );
        } else if (state is LoadingAyatState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.greenForest,
            ),
          );
        } else {
          return const NoInternectConnectionView();
        }
      },
    );
  }
}
