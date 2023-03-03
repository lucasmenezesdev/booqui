import 'package:booqui/layout.dart';
import 'package:booqui/pages/feed_page/feed_page.dart';
import 'package:booqui/pages/initial_page.dart';
import 'package:booqui/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        AuthService.to.userIsAuthenticated.value ? Layout() : InitialPage());
  }
}
