import 'package:flutter/material.dart';
import 'package:hafiz_app/core/helper/storage_helper.dart';
import 'package:hafiz_app/qaran_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageHelper.init();
  runApp(const QaranApp());
}
