import 'package:flutter/material.dart';
import 'package:hafiz_app/Feature/home/data/model/quaran_surah.dart';
import 'package:hafiz_app/Feature/home/presentation/controller/home/home_screen_cubit.dart';
import 'package:hafiz_app/core/routes/app_route.dart';
import 'package:hafiz_app/core/styles/color/app_color.dart';

class SuraListViewItem extends StatelessWidget {
  final Surah surah;
  const SuraListViewItem({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          HomeScreenCubit.instanse.onPresedSuraItem(suraId: surah.id);
          Navigator.of(context)
              .pushNamed(AppRoute.suraScreen, arguments: surah.id);
        },
        child: Row(
          children: [
            Card(
              color: AppColor.lightGreen,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 8.0,
                  bottom: 8.0,
                  right: 16.0,
                ),
                child: Text('${surah.id}'),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                surah.nameEnglish,
              ),
            ),
            Text(
              surah.nameArabic,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
