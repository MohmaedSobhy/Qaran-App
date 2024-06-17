import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafiz_app/Feature/home/data/model/quaran_surah.dart';
import 'package:hafiz_app/Feature/home/presentation/controller/home/home_screen_cubit.dart';
import 'package:hafiz_app/Feature/home/presentation/views/last_sura_read_view_card.dart';
import '../widgets/sura_list_view_item.dart';

class HomeScreenViewbody extends StatelessWidget {
  const HomeScreenViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
            builder: (context, state) {
              return Visibility(
                visible: HomeScreenCubit.instanse.lastSuraId != 0,
                child: LastSuraReadViewCard(
                    suradId: HomeScreenCubit.instanse.lastSuraId),
              );
            },
          ),
        ),
        SliverFillRemaining(
          child: ListView.builder(
            itemCount: QuranIndex.quranSurahs.length,
            itemBuilder: (context, index) {
              return SuraListViewItem(
                surah: QuranIndex.quranSurahs[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
