import 'dart:developer';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafiz_app/Feature/home/data/model/quaran_surah.dart';
import 'package:meta/meta.dart';
part 'play_song_state.dart';

class PlaySongCubit extends Cubit<PlaySongState> {
  PlaySongCubit._() : super(PlaySongInitial());

  String suraAudioUrl = '';
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  bool isPlaying = false;
  int suraId = 0;
  int prevSuraId = 0;
  Duration duration = const Duration();
  double currentPosition = 0;

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
        await audioPlayer.pause();
        isPlaying = false;
      } else {
        isPlaying = true;
        await audioPlayer.play();
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
      currentPosition = 0;
      duration = Duration.zero;
      audioPlayer.pause();
      await playAudioFromNetwork();
      emit(StopPlaySongState());
    } else if (isPlaying == false) {
      await playAudioFromNetwork();
    }
  }

  Future<void> setAudioDuration() async {
    audioPlayer.current.listen((playingAudio) {
      PlaySongCubit.instances.duration =
          playingAudio?.audio.duration ?? Duration.zero;
    });
  }

  Future<void> changeSliderValue({required double value}) async {}

  Future<void> playAudioFromNetwork() async {
    try {
      await audioPlayer.open(
        Audio.network(
          getAudioUrl(),
          metas: Metas(
            title: QuranIndex.quranSurahs[suraId - 1].nameArabic,
            artist: 'مشاري راشد',
            image: const MetasImage.asset('assets/images/appLogo.png'),
          ),
        ),
        autoStart: false,
        showNotification: true,
        notificationSettings: const NotificationSettings(
          nextEnabled: false,
          prevEnabled: false,
          stopEnabled: false,
        ),
      );
      await setAudioDuration();
    } catch (e) {
      log(e.toString());
    }
  }
}
