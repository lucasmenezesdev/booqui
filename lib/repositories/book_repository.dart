import 'package:booqui/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/book.dart';
import '../services/db_firestore.dart';

class BookRepository {
  Future<List<Book>> getBooksCategory(String category) async {
    List<Book> listBook = [];
    FirebaseFirestore db = await DBFirestore.get();
    final docCustomer =
        db.collection("books").where('category', isEqualTo: category);
    final snapshot = await docCustomer.get();
    snapshot.docs.forEach((element) {
      listBook.add(Book(
        element['id'],
        element['title'],
        element['description'],
        element['author'],
        element['category'],
        element['link'],
      ));
    });
    return listBook;
  }

  Future<List<Book>> getBooksCustomer() async {
    List<Book> listBook = [];
    FirebaseFirestore db = await DBFirestore.get();
    final docCustomer = db
        .collection("customers")
        .doc(AuthService.to.auth.currentUser?.uid)
        .collection("myBooks");
    final snapshot = await docCustomer.get();
    snapshot.docs.forEach((element) {
      listBook.add(Book(
        element['id'],
        element['title'],
        element['description'],
        element['author'],
        element['category'],
        element['link'],
      ));
    });
    return listBook;
  }

  Future<List<Book>> getAllBooks() async {
    List<Book> listBook = [];
    FirebaseFirestore db = await DBFirestore.get();
    final docCustomer = db.collection("books");
    final snapshot = await docCustomer.get();
    snapshot.docs.forEach((element) {
      listBook.add(Book(
        element['id'],
        element['title'],
        element['description'],
        element['author'],
        element['category'],
        element['link'],
      ));
    });
    return listBook;
  }
}
