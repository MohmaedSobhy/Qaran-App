import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafiz_app/core/styles/theme/controller/app_theme_cubit.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            AppThemeCubit.instanse.changeTheme();
          },
          icon: Icon(
            Icons.light_mode,
          ),
        );
      },
    );
  }
}
