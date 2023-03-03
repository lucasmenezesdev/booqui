import 'package:booqui/pages/favorites_page.dart';
import 'package:booqui/pages/feed_page/feed_page.dart';
import 'package:booqui/pages/library_page/library_page.dart';
import 'package:booqui/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'models/customer.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  PageController _pageController = PageController();
  int itemIndex = 0;
  Customer customer = Customer.get();

  void setItemIndex(int index) {
    setState(() {
      itemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Seja bem vindo(a)!'),
            Text(
              customer.getName(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black45, blurRadius: 10)
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          backgroundColor: black,
          currentIndex: itemIndex,
          onTap: (int page) {
            setItemIndex(page);
            _pageController.animateToPage(page,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
          items: [
            BottomNavigationBarItem(
                icon: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: green, borderRadius: BorderRadius.circular(30)),
                    child: Icon(Icons.home)),
                label: 'Explorar'),
            BottomNavigationBarItem(
                icon: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: green, borderRadius: BorderRadius.circular(30)),
                    child: Icon(Icons.book)),
                label: 'Minha biblioteca'),
            BottomNavigationBarItem(
                icon: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: green, borderRadius: BorderRadius.circular(30)),
                    child: Icon(Icons.star)),
                label: 'Favoritos'),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          FeedPage(),
          LibraryPage(),
          FavoritesPage(),
        ],
      ),
    );
  }
}
