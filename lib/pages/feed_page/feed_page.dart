import 'package:booqui/pages/feed_page/widgets/list_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/customer.dart';
import '../../repositories/book_repository.dart';
import '../../services/auth_service.dart';
import '../../styles.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    Customer customer = Customer.get();
    return ListView(
      children: [
        SizedBox(
          height: 30,
        ),
        ListBooks(),
        ListBooks(),
        ListBooks(),
      ],
    );
  }
}
