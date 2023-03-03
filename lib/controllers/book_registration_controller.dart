import 'dart:io';
import 'package:booqui/controllers/library_controller.dart';
import 'package:booqui/services/db_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../services/auth_service.dart';

class BookRegistrationController extends GetxController {
  late String? filePath;
  RxString fileName = 'Adicione seu PDF'.obs;
  late File file;
  var isLoading = false.obs;

  var title = TextEditingController();
  var author = TextEditingController();
  var description = TextEditingController();
  String dropValue = 'Romance';

  var errorTitle = ''.obs;
  var errorAuthor = ''.obs;
  var errorDescription = ''.obs;

  String titleSnackbar = '';
  String msgSnackbar = '';
  Color colorSnackbar = Colors.transparent;

  void showSnackbar() {
    SnackBar(
      content: Text(msgSnackbar),
      backgroundColor: colorSnackbar,
    );
  }

  Future<void> pdfSelect() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      filePath = result.files.first.path;
      fileName.value = result.files.first.name;
      file = File(filePath!);
    }
  }

  Future<void> pdfUpload(BuildContext context) async {
    isLoading.value = true;
    if (title.text != '' && description.text != '' && filePath != null) {
      FirebaseFirestore db = await DBFirestore.get();
      var auth = AuthService.to;

      try {
        // Upload file

        String fileId = Uuid().v4();
        await FirebaseStorage.instance.ref('books/$fileId').putFile(file);
        Reference ref = FirebaseStorage.instance.ref().child('books/$fileId');
        String linkDownload = await ref.getDownloadURL();
        db.collection("books").doc(fileId).set(
          {
            "id": fileId,
            "title": title.text,
            "description": description.text,
            "author": author.text,
            "category": dropValue,
            "link": linkDownload,
          },
        );
        db
            .collection("customers")
            .doc(auth.auth.currentUser?.uid)
            .collection("myBooks")
            .doc(fileId)
            .set({
          "id": fileId,
          "title": title.text,
          "description": description.text,
          "author": author.text,
          "category": dropValue,
          "link": linkDownload,
        });
        var libraryController = Get.put(LibraryController());
        libraryController.getBooks();

        msgSnackbar = 'Sucesso: PDF adicionado.';
        colorSnackbar = Colors.green;
        Navigator.pop(context);
      } catch (e) {
        msgSnackbar = 'Erro!' + e.toString();
        colorSnackbar = Colors.redAccent;
        print(e);
      }
    } else {
      if (description.text == '') {
        errorDescription.value = 'Adicione uma descrição';
      }
      if (author.text == '') {
        errorTitle.value = 'Adicione o nome do(s) autor(es)';
      }
      if (title.text == '') {
        errorTitle.value = 'Adicione um título';
      }

      update();
    }
    isLoading.value = false;
  }
}
