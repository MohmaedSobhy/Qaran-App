import 'package:flutter/material.dart';
import 'package:hafiz_app/Feature/home/presentation/views/sura_ayat_list_view.dart';
import 'package:hafiz_app/Feature/home/presentation/views/sura_name_card_view.dart';

class SuraScreenViewBody extends StatelessWidget {
  final int suraId;
  const SuraScreenViewBody({super.key, required this.suraId});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SuraNameCardView(
            suradId: suraId,
          ),
        ),
        const SliverFillRemaining(
          child: SuraAyatListView(),
        ),
      ],
    );
  }
}
