import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafiz_app/Feature/home/data/model/quaran_surah.dart';
import 'package:hafiz_app/Feature/home/presentation/controller/play_song/play_song_cubit.dart';
import 'package:hafiz_app/Feature/home/presentation/views/audio_view_slider.dart';
import 'package:hafiz_app/Feature/home/presentation/widgets/custome_pause_button.dart';
import 'package:hafiz_app/Feature/home/presentation/widgets/custome_play_button.dart';
import 'package:hafiz_app/core/styles/color/app_color.dart';

class PlaySoundButtonView extends StatelessWidget {
  final int suraId;
  const PlaySoundButtonView({super.key, required this.suraId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: PlaySongCubit.instances
        ..setSuraId(suraId: suraId)
        ..checkAudio(),
      child: BlocConsumer<PlaySongCubit, PlaySongState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            width: double.infinity,
            color: Colors.grey[300]!,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Text(
                    QuranIndex.quranSurahs[suraId - 1].nameArabic,
                    textDirection: TextDirection.ltr,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColor.darkGreen,
                        ),
                  ),
                  const Expanded(
                    child: AudioViewSlider(),
                  ),
                  Visibility(
                    visible: (PlaySongCubit.instances.isPlaying == false &&
                        state is! PlaySongLoadingState),
                    child: PlayButtonIcon(onTap: () {
                      PlaySongCubit.instances.playAudio();
                    }),
                  ),
                  Visibility(
                    visible: state is PlaySongLoadingState,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: PlaySongCubit.instances.isPlaying,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: PauseButtonIcon(onTap: () {
                        PlaySongCubit.instances.playAudio();
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
