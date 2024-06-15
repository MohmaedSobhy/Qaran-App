import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hafiz_app/Feature/home/data/model/quaran_surah.dart';
import 'package:hafiz_app/core/extensions/context_extensions.dart';
import 'package:hafiz_app/core/routes/app_route.dart';
import 'package:hafiz_app/core/styles/color/app_text_style.dart';
import 'package:hafiz_app/core/utils/image_assets.dart';
import 'package:hafiz_app/core/widgets/custome_button.dart';

class LastSuraReadViewCard extends StatelessWidget {
  final int suradId;
  const LastSuraReadViewCard({super.key, required this.suradId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: context.getScreenHight() * 0.25,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: const LinearGradient(
            colors: [Color(0xFF006754), Color(0xFF87D1A4)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.loaclization().lastRead,
                    style: AppTextStyle.text18Black.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    QuranIndex.quranSurahs[suradId - 1].nameArabic,
                    style: AppTextStyle.textAmiri20.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomeButton(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AppRoute.suraScreen, arguments: suradId);
                    },
                    title: context.loaclization().continueRead,
                  )
                ],
              ),
            ),
            Expanded(child: SvgPicture.asset(ImageAssets.imgQuranOnboarding))
          ],
        ),
      ),
    );
  }
}
