import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations loaclization() {
    return AppLocalizations.of(this)!;
  }

  double getScreenHight() {
    return MediaQuery.sizeOf(this).height;
  }

  double getScreenWidth() {
    return MediaQuery.sizeOf(this).width;
  }
}
