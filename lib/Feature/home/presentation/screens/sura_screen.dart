import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafiz_app/Feature/home/presentation/controller/sura/sura_cubit.dart';
import 'package:hafiz_app/Feature/home/presentation/views/sura_screen_view_body.dart';

class SuraScreen extends StatelessWidget {
  final int suraId;
  const SuraScreen({super.key, required this.suraId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider.value(
        value: SuraCubit.instanse..fetchAyatSura(suraId: suraId),
        child: Scaffold(
          body: SuraScreenViewBody(
            suraId: suraId,
          ),
        ),
      ),
    );
  }
}
