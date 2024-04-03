import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_api/pages/all_product.dart';
import 'package:phone_api/category/home_decoration.dart';
import 'package:phone_api/pages/category.dart';

import 'add_new.dart';

class BottomNavBar extends StatefulWidget {
  static const String id = "home_page";

  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late PageController pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          controller: pageController,
          children: const [
            AllProduct(),
            AddNewProduct(),
            HomePage(),
            AddNewProduct(),
          ],
          onPageChanged: (int index) {
            setState(
              () {
                selectedIndex = index;
              },
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (int index) {
            setState(
              () {
                selectedIndex = index;
                pageController.animateToPage(index,
                    duration: const Duration(
                      microseconds: 200,
                    ),
                    curve: Curves.bounceOut);
              },
            );
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                backgroundColor: Colors.white,
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.ticket, color: Colors.blue),
                backgroundColor: Colors.white,
                label: "Tickets"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_rounded, color: Colors.blue),
                backgroundColor: Colors.white,
                label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.add_circled, color: Colors.blue),
                backgroundColor: Colors.white,
                label: "Add"),
          ],
          selectedItemColor: Colors.blue,
        ),
      ),
    );
  }
}
