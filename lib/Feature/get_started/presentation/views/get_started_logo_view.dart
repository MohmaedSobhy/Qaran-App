import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafiz_app/core/extensions/context_extensions.dart';
import 'package:hafiz_app/core/styles/color/app_color.dart';
import 'package:hafiz_app/core/utils/image_assets.dart';

class GetStartedLogoView extends StatelessWidget {
  const GetStartedLogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.getScreenWidth() * 0.08,
        right: context.getScreenWidth() * 0.08,
        top: context.getScreenHight() * 0.02,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.greenForest,
        ),
        child: SvgPicture.asset(
          ImageAssets.imgQuranOnboarding,
        ),
      ),
    );
  }
}
