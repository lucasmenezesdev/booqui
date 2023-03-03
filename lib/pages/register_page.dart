import 'package:booqui/controllers/register_controller.dart';
import 'package:booqui/services/auth_service.dart';
import 'package:booqui/widgets/mainbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controller = Get.put(RegisterController());
  final auth = AuthService.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: green),
          child: const BackButton(),
        ),
        elevation: 0,
      ),
      backgroundColor: black,
      body: ListView(children: [
        Stack(children: [
          Positioned(
              top: -30,
              left: 50,
              child: Image.asset('assets/images/elipsegreen.png')),
          Positioned(
              right: 50,
              bottom: -80,
              child: Image.asset('assets/images/elipsepurple.png')),
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
                        'REGISTRAR',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                            color: cream),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        width: 320,
                        child: TextField(
                          controller: controller.nome,
                          decoration: InputDecoration(
                              label: const Text('Nome'),
                              filled: true,
                              fillColor: cream),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: 320,
                        child: TextField(
                          controller: controller.sobrenome,
                          decoration: InputDecoration(
                              label: const Text('Sobrenome'),
                              filled: true,
                              fillColor: cream),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
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
                      SizedBox(
                        width: 320,
                        child: TextField(
                          controller: controller.senha,
                          obscureText: true,
                          decoration: InputDecoration(
                              label: const Text('Senha'),
                              filled: true,
                              fillColor: cream),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MainButton(
                        text: 'Confirmar',
                        color: cream,
                        onPressed: () => {
                          auth.register(
                            controller.nome.text,
                            controller.sobrenome.text,
                            controller.email.text,
                            controller.senha.text,
                            context,
                          )
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ]),
    );
  }
}
