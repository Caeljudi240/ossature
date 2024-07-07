import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controllers/auth_controller.dart';
import 'services/localization_service.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/signup_view.dart';
import 'guards/auth_guard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalizationService.loadTranslations();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalizationService(),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => const AuthWrapper(),
            middlewares: [AuthGuard()]),
        GetPage(
            name: '/home', page: () => HomeView(), middlewares: [AuthGuard()]),
        GetPage(name: '/login', page: () => LoginView()),
        GetPage(name: '/signup', page: () => SignUpView()),
      ],
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      init: AuthController(),
      builder: (controller) {
        if (controller.userFirebase != null) {
          return HomeView();
        } else {
          return LoginView();
        }
      },
    );
  }
}
