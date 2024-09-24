import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hafiz_app/Feature/home/presentation/controller/play_song/play_song_cubit.dart';
import 'package:hafiz_app/core/styles/color/app_color.dart';

class AudioViewSlider extends StatefulWidget {
  const AudioViewSlider({
    super.key,
  });

  @override
  State<AudioViewSlider> createState() => _AudioViewSliderState();
}

class _AudioViewSliderState extends State<AudioViewSlider> {
  AssetsAudioPlayer player = PlaySongCubit.instances.audioPlayer;
  @override
  void initState() {
    super.initState();

    player.current.listen((playingAudio) {
      PlaySongCubit.instances.duration =
          playingAudio?.audio.duration ?? Duration.zero;

      if (mounted) {
        setState(() {});
      }
    });

    player.currentPosition.listen((position) {
      PlaySongCubit.instances.currentPosition = position.inSeconds.toDouble();
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Text(
            formatDuration(
              Duration(
                  seconds: PlaySongCubit.instances.currentPosition.toInt()),
            ),
          ),
          Expanded(
            child: Slider(
              onChanged: (value) {},
              activeColor: Colors.green,
              inactiveColor: AppColor.lightGreen,
              min: 0,
              max: PlaySongCubit.instances.duration.inSeconds.toDouble(),
              value: PlaySongCubit.instances.currentPosition,
            ),
          ),
          Text(formatDuration(PlaySongCubit.instances.duration)),
        ],
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final hours = twoDigits(duration.inHours); // Extract hours
    final minutes = twoDigits(duration.inMinutes
        .remainder(60)); // Extract minutes (remainder after hours)
    final seconds = twoDigits(duration.inSeconds
        .remainder(60)); // Extract seconds (remainder after minutes)

    if (duration.inHours > 0) {
      return '$hours:$minutes:$seconds';
    } else {
      return '$minutes:$seconds';
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
