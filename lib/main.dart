import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ossature/config/theme.dart';
import 'package:ossature/router/app_router.dart';
import 'package:ossature_core/core/application.dart';

Future<void> main(List<String> args) async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );

  final appRouter = AppRouter();

  final application = Application(
    initTheme: initTheme(),
    router: appRouter,
  );

  await application.launch();
}
