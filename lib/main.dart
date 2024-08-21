import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import "package:get/get.dart";
import 'package:task_manager/ui/routes/app_route.dart';
import 'package:task_manager/ui/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightTheme(context),
      themeMode: ThemeMode.light,
      getPages: getPages,
      initialRoute: navigation,
      unknownRoute: getPages.first,
    );
  }
}




