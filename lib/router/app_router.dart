import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ossature_core/auth/controllers/auth_controller.dart';
import '../views/home_view.dart';
import '../views/login_view.dart';
import '../views/signup_view.dart';

class AppRouter {
  AppRouter();

  List<GetPage> getPages() {
    return [
      GetPage(
        name: '/',
        page: () => const AuthWrapper(),
      ),
      GetPage(
        name: '/home',
        page: () => HomeView(),
      ),
      GetPage(name: '/login', page: () => LoginView()),
      GetPage(name: '/signup', page: () => SignUpView()),
    ];
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
