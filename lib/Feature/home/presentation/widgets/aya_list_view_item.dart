import 'package:flutter/material.dart';
import 'package:hafiz_app/core/styles/color/app_color.dart';

class AyaListViewItem extends StatelessWidget {
  final String ayaTextAr;
  final String ayaTextEn;
  final int ayaIndex;
  const AyaListViewItem({
    super.key,
    required this.ayaTextAr,
    required this.ayaTextEn,
    required this.ayaIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, right: 12, left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              ayaTextAr,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    wordSpacing: 3,
                  ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            ayaTextEn,
            textDirection: TextDirection.ltr,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  wordSpacing: 3,
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                '$ayaIndex',
                style: TextStyle(
                  color: (Theme.of(context).scaffoldBackgroundColor ==
                          Colors.white)
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  height: 3,
                  decoration: BoxDecoration(
                    color: (Theme.of(context).scaffoldBackgroundColor ==
                            Colors.white)
                        ? AppColor.lightGreen
                        : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
