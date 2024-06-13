import 'package:flutter/material.dart';
import 'package:hafiz_app/core/extensions/context_extensions.dart';
import 'package:hafiz_app/core/widgets/custome_button.dart';

class GetStartedDtailsView extends StatelessWidget {
  const GetStartedDtailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
          height: 50,
        ),
        Text(
          context.loaclization().appName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          context.loaclization().learnQuran,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(
          height: 30,
        ),
        CustomeButton(
          onTap: () {},
          title: context.loaclization().getStarted,
        ),
        SizedBox(
          height: context.getScreenHight() * 0.1,
        ),
      ],
    );
  }
}
