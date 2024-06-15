part of 'sura_cubit.dart';

@immutable
sealed class SuraState {}

final class SuraInitial extends SuraState {}

final class LoadingAyatState extends SuraState {}

final class SuccessLoadingAyats extends SuraState {}

final class FailedLoadingAyats extends SuraState {}
