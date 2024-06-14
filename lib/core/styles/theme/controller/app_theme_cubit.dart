import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hafiz_app/core/helper/storage_helper.dart';
import 'package:meta/meta.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  final String themekey = 'Theme Key';
  AppThemeCubit._() : super(AppThemeInitial());

  IconData currentIcon = Icons.light_mode_sharp;

  static AppThemeCubit instanse = AppThemeCubit._();

  void checkTheme() async {
    dynamic currentTheme = await StorageHelper.get(key: themekey) ?? 'light';

    if (currentTheme == 'light') {
      currentIcon = Icons.light_mode_sharp;
      emit(LightThemeState());
    } else {
      currentIcon = Icons.dark_mode_sharp;
      emit(DarkThemeState());
    }
  }

  void changeTheme() async {
    String currentTheme = await StorageHelper.get(key: themekey) ?? 'light';

    if (currentTheme == 'light') {
      await StorageHelper.put(key: themekey, value: 'dark');
      currentIcon = Icons.dark_mode_sharp;
      emit(DarkThemeState());
    } else {
      await StorageHelper.put(key: themekey, value: 'light');
      currentIcon = Icons.light_mode_sharp;
      emit(LightThemeState());
    }
  }
}
