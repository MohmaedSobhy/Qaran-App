import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafiz_app/Feature/home/presentation/controller/home/home_screen_cubit.dart';
import 'package:hafiz_app/Feature/home/presentation/views/app_bar_icon_button.dart';
import 'package:hafiz_app/Feature/home/presentation/views/home_screen_view.body.dart';
import 'package:hafiz_app/core/extensions/context_extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: HomeScreenCubit.instanse..checkLastSuraRead(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.loaclization().appName),
          actions: const [
            AppBarIconButton(),
          ],
        ),
        body: const HomeScreenViewbody(),
      ),
    );
  }
}
