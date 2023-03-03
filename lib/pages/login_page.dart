import 'package:booqui/controllers/login_controller.dart';
import 'package:booqui/services/auth_service.dart';
import 'package:booqui/widgets/mainbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles.dart';
import '../widgets/returnbutton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.put(LoginController());
  final auth = AuthService.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: black,
          leading: const ReturnButton(),
          elevation: 0,
        ),
        backgroundColor: black,
        body: Stack(
          children: [
            //Init background circles
            Positioned(
                top: -30,
                left: 50,
                child: Image.asset('assets/images/elipsegreen.png')),
            Positioned(
                right: 50,
                bottom: -80,
                child: Image.asset('assets/images/elipsepurple.png')),
            //End background circles
            Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'LOGIN',
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold),
                                        color: cream),
                                  ),
                                  const SizedBox(
                                    height: 100,
                                  ),
                                  //E-mail input
                                  SizedBox(
                                    width: 320,
                                    child: TextField(
                                      controller: controller.email,
                                      decoration: InputDecoration(
                                          label: const Text('E-mail'),
                                          filled: true,
                                          fillColor: cream),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  //Password input
                                  SizedBox(
                                    width: 320,
                                    child: TextField(
                                      controller: controller.senha,
                                      decoration: InputDecoration(
                                          label: const Text('Senha'),
                                          filled: true,
                                          fillColor: cream),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  //Confirm Button
                                  MainButton(
                                      text: 'Confirmar',
                                      color: cream,
                                      onPressed: () => {
                                            controller.login(
                                                controller.email.text,
                                                controller.senha.text,
                                                context)
                                          })
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
            )
          ],
        ));
  }
}
