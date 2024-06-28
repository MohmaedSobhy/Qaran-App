import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'play_song_state.dart';

class PlaySongCubit extends Cubit<PlaySongState> {
  PlaySongCubit._() : super(PlaySongInitial());

  String suraAudioUrl = '';
  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  int suraId = 0;
  int prevSuraId = 0;
  Duration duration = Duration();
  Duration position = Duration();

  static PlaySongCubit instances = PlaySongCubit._();

  void setSuraId({required int suraId}) {
    this.suraId = suraId;
    if (prevSuraId == 0) {
      prevSuraId = suraId;
    }
  }

  Future<void> playAudio() async {
    emit(PlaySongLoadingState());
    try {
      if (isPlaying) {
        await player.pause();
        isPlaying = false;
      } else {
        isPlaying = true;
        await player.resume();
      }
      emit(PlaySongSuccessState());
    } catch (error) {
      emit(PlaySongFailedState());
    }
  }

  String getAudioUrl() {
    String url =
        'https://equran.nos.wjv-1.neo.id/audio-full/Misyari-Rasyid-Al-Afasi/';

    int length = suraId.toString().length;
    if (length == 1) {
      return '${url}00$suraId.mp3';
    } else if (length == 2) {
      return '${url}00$suraId.mp3';
    }
    return '$url$suraId.mp3';
  }

  Future<void> checkAudio() async {
    if (isPlaying && prevSuraId != suraId) {
      isPlaying = false;
      prevSuraId = suraId;
      position = Duration.zero;
      player.pause();
      await setAudio();
      emit(StopPlaySongState());
    } else if (isPlaying == false) {
      setAudio();
    }
  }

  Future<void> setAudioDuration() async {
    player.getDuration().then((value) {
      duration = value!;
    });
  }

  Future<void> changeSliderValue({required double value}) async {}

  Future<void> setAudio() async {
    try {
      await player.setSource(UrlSource(getAudioUrl()));
      await setAudioDuration();
    } catch (error) {
      emit(PlaySongFailedState());
    }
  }
}
