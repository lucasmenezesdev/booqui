// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

import '../../../controllers/library_controller.dart';
import '../../../styles.dart';

class BookItem extends StatefulWidget {
  final int index;
  const BookItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  var doc;

  void setDoc() async {
    var controller = Get.put(LibraryController());
    doc = await controller.myBooks[widget.index].showCover();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LibraryController>(
        init: LibraryController(),
        builder: (_) => Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('assets/images/capa1.png')
                    // child: PdfPageView(
                    //   pageNumber: 1,
                    //   //pdfDocument: PdfDocument.openFile(''),
                    // ),
                    ),
                Text(
                  _.myBooks.value[widget.index].title,
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
            ));
  }
}
