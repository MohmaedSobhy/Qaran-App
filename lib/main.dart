import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafiz_app/bloc_observer.dart';
import 'package:hafiz_app/core/api/dio_helper.dart';
import 'package:hafiz_app/core/helper/storage_helper.dart';
import 'package:hafiz_app/qaran_app.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageHelper.init();
  Bloc.observer = AppBlocObserval();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    DioService.init(),
  ]);
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const QaranApp(), // Wrap your app
    ),
  );
}
