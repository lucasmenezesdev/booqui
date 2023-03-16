import 'dart:async';

import 'package:pdf_render/pdf_render.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class Book {
  final String id;
  final String title;
  final String description;
  final String author;
  final String category;
  final String link;

  Book(
    this.id,
    this.title,
    this.description,
    this.author,
    this.category,
    this.link,
  );

  Future<PdfDocument> showCover() async {
    final document = await PdfDocument.openFile(link);
    return document;
  }
}
