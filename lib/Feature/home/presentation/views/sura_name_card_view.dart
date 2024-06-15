import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hafiz_app/Feature/home/data/model/quaran_surah.dart';
import 'package:hafiz_app/core/extensions/context_extensions.dart';
import 'package:hafiz_app/core/styles/color/app_color.dart';
import 'package:hafiz_app/core/styles/color/app_text_style.dart';
import 'package:hafiz_app/core/utils/image_assets.dart';

class SuraNameCardView extends StatelessWidget {
  final int suradId;
  const SuraNameCardView({
    super.key,
    required this.suradId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.getScreenHight() * 0.20,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF006754), Color(0xFF87D1A4)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.white,
              size: 30,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  QuranIndex.quranSurahs[suradId - 1].nameArabic,
                  style: AppTextStyle.textAmiri30,
                ),
                Divider(
                  color: AppColor.white,
                  height: 2,
                  thickness: 1,
                  indent: context.getScreenWidth() * 0.12,
                  endIndent: context.getScreenWidth() * 0.12,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Image(
                  image: AssetImage('assets/images/bismillah.png'),
                  fit: BoxFit.scaleDown,
                ),
              ],
            ),
          ),
          Expanded(
            child: SvgPicture.asset(
              ImageAssets.imgQuranOnboarding,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
