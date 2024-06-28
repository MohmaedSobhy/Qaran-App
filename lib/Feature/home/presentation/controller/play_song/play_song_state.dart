part of 'play_song_cubit.dart';

@immutable
sealed class PlaySongState {}

final class PlaySongInitial extends PlaySongState {}

final class PlaySongLoadingState extends PlaySongState {}

final class PlaySongSuccessState extends PlaySongState {}

final class PlaySongFailedState extends PlaySongState {}

final class StopPlaySongState extends PlaySongState {}

final class PlaySongSliderState extends PlaySongState {}
