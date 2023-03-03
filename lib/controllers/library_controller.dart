import 'package:booqui/repositories/book_repository.dart';
import 'package:get/get.dart';

import '../models/book.dart';

class LibraryController extends GetxController {
  RxList myBooks = [].obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    getBooks();
  }

  Future<void> getBooks() async {
    myBooks.value = await BookRepository().getBooksCustomer();
    print(myBooks.value[0].title);
  }
}
