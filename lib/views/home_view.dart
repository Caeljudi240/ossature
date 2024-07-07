import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ossature_core/auth/controllers/auth_controller.dart';
import 'package:ossature_core/services/localization_service.dart';

class HomeView extends StatelessWidget {
  final _authController = Get.find<AuthController>();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _authController.signOut();
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hello'.tr),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                LocalizationService().changeLocale('Français');
              },
              child: const Text('Change to French'),
            ),
            ElevatedButton(
              onPressed: () {
                LocalizationService().changeLocale('English');
              },
              child: const Text('Change to English'),
            ),
          ],
        ),
      ),
    );
  }
}
