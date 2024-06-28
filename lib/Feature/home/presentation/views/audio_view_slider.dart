import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
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
  AudioPlayer player = PlaySongCubit.instances.player;
  @override
  void initState() {
    super.initState();

    player.onDurationChanged.listen((duration) {
      PlaySongCubit.instances.duration = duration;
      if (mounted) {
        setState(() {});
      }
    });

    player.onPositionChanged.listen((position) {
      PlaySongCubit.instances.position = position;
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
          Text(_formatDuration(PlaySongCubit.instances.position)),
          Expanded(
            child: Slider(
              onChanged: (value) {
                PlaySongCubit.instances.changeSliderValue(value: value);
              },
              activeColor: Colors.green,
              inactiveColor: AppColor.lightGreen,
              min: 0,
              max: PlaySongCubit.instances.duration.inSeconds.toDouble(),
              value: PlaySongCubit.instances.position.inSeconds.toDouble(),
            ),
          ),
          Text(_formatDuration(PlaySongCubit.instances.duration)),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitHours = twoDigits(duration.inHours.remainder(24));
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (twoDigitHours == '00') return "$twoDigitMinutes:$twoDigitSeconds";
    return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    super.dispose();
  }
}
