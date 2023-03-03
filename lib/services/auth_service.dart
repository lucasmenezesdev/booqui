import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'db_firestore.dart';
import '../models/customer.dart';

class AuthService extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser;
  var userIsAuthenticated = false.obs;
  Customer customer = Customer.get();

  Future readCustomer() async {
    FirebaseFirestore db = await DBFirestore.get();
    final docCustomer = db.collection("customers").doc(auth.currentUser?.uid);
    final snapshot = await docCustomer.get();

    if (snapshot.exists) {
      print('existe');
      await customer.fromJson(snapshot.data()!);
    } else
      print('não existe');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _firebaseUser = Rx<User?>(auth.currentUser);
    _firebaseUser.bindStream(auth.authStateChanges());
    ever(_firebaseUser, (User? user) async {
      if (user != null) {
        await readCustomer();

        userIsAuthenticated.value = true;
      } else {
        userIsAuthenticated.value = false;
      }
    });
  }

  User? get user => _firebaseUser.value;
  static AuthService get to => Get.find<AuthService>();

  showSnack(String titulo, String erro) {
    Get.snackbar(
      titulo,
      erro,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  register(String name, String lastName, String email, String password,
      BuildContext context) async {
    FirebaseFirestore db = await DBFirestore.get();
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      db.collection("customers").doc(auth.currentUser?.uid).set(
        {
          "id": auth.currentUser?.uid,
          "name": name,
          "lastName": lastName,
          "email": auth.currentUser?.email,
        },
      );
      Navigator.pop(context);
    } catch (e) {
      Get.snackbar(
        "Erro ao registrar!",
        "",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  login(String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      print(auth.currentUser?.email);
      Navigator.pop(context);
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: "Erro ao fazer login!",
        message: e.toString(),
        backgroundColor: Colors.redAccent,
      ));
    }
  }

  logout() async {
    try {
      auth.signOut();
    } catch (e) {
      showSnack("Erro ao sair!", e.toString());
    }
  }
}
