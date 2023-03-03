import 'package:booqui/styles.dart';
import 'package:booqui/widgets/mainbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(children: [
        Positioned(
            top: 50,
            right: 50,
            child: Image.asset('assets/images/elipsegreen.png')),
        Positioned(
            bottom: -80, child: Image.asset('assets/images/elipsepurple.png')),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'BOOQUI',
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                    color: cream),
              ),
              const SizedBox(
                height: 150,
              ),
              MainButton(
                  text: 'Entrar',
                  color: cream,
                  onPressed: () => Navigator.pushNamed(context, '/login')),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 75,
                width: 320,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                              (states) => cream)),
                  onPressed: () => {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/google.png',
                        height: 50,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Google',
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                            color: black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ainda não tem conta?',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                        color: cream),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    child: Text(
                      'Registre-se agora',
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                          color: green),
                    ),
                    onTap: () => {Navigator.pushNamed(context, '/register')},
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
