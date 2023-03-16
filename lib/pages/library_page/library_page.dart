import 'package:booqui/pages/book_details.dart';
import 'package:booqui/pages/book_registration_page.dart';
import 'package:booqui/pages/library_page/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/library_controller.dart';
import '../../models/customer.dart';
import '../../styles.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  Customer customer = Customer.get();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LibraryController>(
      init: LibraryController(),
      builder: (_) => Scaffold(
        backgroundColor: black,
        body: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width - 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: purple),
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookRegistrationPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '+',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Adicionar livro'),
                      ],
                    ))),
            SizedBox(
              height: 25,
            ),
            Obx(
              () => Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(20),  
                  itemCount: _.myBooks.value.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BookDetails(book: _.myBooks.value[index]))),
                      child: BookItem(
                        index: index,
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.55,
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
