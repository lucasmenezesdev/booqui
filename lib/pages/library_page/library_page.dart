import 'package:booqui/pages/book_registration_page.dart';
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
              () => SizedBox(
                height: MediaQuery.of(context).size.height - 300,
                child: GridView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: _.myBooks.value.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset('assets/images/capa1.png')),
                        Text(
                          _.myBooks.value[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Quantidade de favoritos
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  '4,9',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            //Quantidade de downloads
                            Row(
                              children: [
                                Icon(
                                  Icons.download,
                                  color: green,
                                ),
                                Text(
                                  '459',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
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
