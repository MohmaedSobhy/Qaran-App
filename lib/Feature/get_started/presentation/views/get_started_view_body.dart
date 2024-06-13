import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hafiz_app/Feature/get_started/presentation/views/get_started_details_view.dart';
import 'package:hafiz_app/Feature/get_started/presentation/views/get_started_logo_view.dart';
import 'package:hafiz_app/core/extensions/context_extensions.dart';
import 'package:hafiz_app/core/styles/color/app_color.dart';
import 'package:hafiz_app/core/utils/image_assets.dart';

class GetStartedViewBody extends StatelessWidget {
  const GetStartedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          ImageAssets.imgGroupCircles,
        ),
        const Expanded(
          child: GetStartedLogoView(),
        ),
        const GetStartedDtailsView(),
      ],
    );
  }
}
