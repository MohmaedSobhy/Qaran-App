part of 'app_theme_cubit.dart';

@immutable
sealed class AppThemeState {}

final class AppThemeInitial extends AppThemeState {}

final class LightThemeState extends AppThemeState {}

final class DarkThemeState extends AppThemeState {}
