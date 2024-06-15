import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:hafiz_app/Feature/home/presentation/controller/home/home_screen_cubit.dart';
import 'package:hafiz_app/Feature/home/presentation/views/app_bar_icon_button.dart';
import 'package:hafiz_app/Feature/home/presentation/views/home_screen_view.body.dart';
import 'package:hafiz_app/core/extensions/context_extensions.dart';
import 'package:hafiz_app/core/widgets/no_internect_connection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: HomeScreenCubit.instanse..checkLastSuraRead(),
      child: OfflineBuilder(
        connectivityBuilder: (context, connectivity, child) {
          return (connectivity != ConnectivityResult.none)
              ? const HomeScreenView()
              : const NoInternectConnectionView();
        },
        child: const HomeScreenView(),
      ),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loaclization().appName),
        actions: const [
          AppBarIconButton(),
        ],
      ),
      body: const HomeScreenViewbody(),
    );
  }
}
