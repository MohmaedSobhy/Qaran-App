import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hafiz_app/core/api/dio_helper.dart';
import 'package:hafiz_app/core/helper/storage_helper.dart';
import 'package:hafiz_app/qaran_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageHelper.init();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    DioService.init(),
  ]);
  runApp(const QaranApp());
}
