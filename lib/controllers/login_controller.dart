import 'package:booqui/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = TextEditingController();
  var senha = TextEditingController();
  var isLoading = false.obs;

  var auth = AuthService.to;

  void login(String email, String senha, BuildContext context) async {
    isLoading.value = true;
    await auth.login(email, senha, context);
    isLoading.value = false;
  }
}
