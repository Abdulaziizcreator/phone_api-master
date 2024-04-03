import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:phone_api/category/fragrences.dart';
import 'package:phone_api/category/laptops.dart';
import 'package:phone_api/category/skinCare.dart';
import 'package:phone_api/category/smartphones.dart';
import 'package:phone_api/service/service.dart';

import '../category/groceries.dart';
import '../model/model.dart';
import '../category/home_decoration.dart';

class HomePage extends StatefulWidget {
  static const String id = 'homePage';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var logger = Logger();
  List items = [];
  bool isLoading = false;
  List<Product> sortedList = [];

  void getData() {
    ProductService.GET(ProductService.GET_API, ProductService.paramsGet())
        .then((response) => logger.i(response));
  }

  void getCatagory() {
    ProductService.GET_CATAGORY(ProductService.GET_CATEGORIES_API,
            ProductService.paramsGetCatagory())
        .then((response) => logger.i(response));
  }

  void parsingCategory() {
    ProductService.GET_CATAGORY(ProductService.GET_CATEGORIES_API,
            ProductService.paramsGetCatagory())
        .then((response) => {
              setState(() {
                isLoading = true;
                items = ProductService.parsingResponse(response!);
                isLoading = false;
              }),
            });
  }

  List<Product> parsingLaptops(String category) {
    ProductService.GET(ProductService.GET_API, ProductService.paramsGet())
        .then((response) => {
              setState(() {
                logger.w(response);
                items = ProductService.parsingResponse(response!);
                for (Product products in items) {
                  if (products.category == category) {
                    sortedList.add(products);
                  }
                }
              }),
            });
    return sortedList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gadgets".toUpperCase()),
          backgroundColor: const Color(0xFF174D5A),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.white,
                )),
          ],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
        ),
        backgroundColor: const Color(0xFFc1c3c7),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Accessories',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeeDecoration()));
                      },
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/home_page/homedecoration.jpg'),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20,
                                offset: (Offset(20, 20)))
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "home-decoration",
                            style: TextStyle(
                                fontFamily: ('homePage'), fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Smartphones()));
                      },
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/home_page/smartphone.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20,
                                offset: (Offset(20, 20)))
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Smartphone",
                                style: TextStyle(
                                    fontFamily: ('homePage'), fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SkinCare()));
                      },
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/home_page/skincare.jpg'),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20,
                                offset: (Offset(20, 20)))
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "skinCare",
                            style: TextStyle(
                                fontFamily: ('homePage'), fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Groceries()));
                      },
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/home_page/groceries.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20,
                                offset: (Offset(20, 20)))
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "groceries",
                                style: TextStyle(
                                    fontFamily: ('homePage'), fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Laptops()));
                      },
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/home_page/laptop1.jpg'),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20,
                                offset: (Offset(20, 20)))
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Laptops",
                            style: TextStyle(
                                fontFamily: ('homePage'), fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Fragrances()));
                      },
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/home_page/fragrances.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20,
                                offset: (Offset(20, 20)))
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Fragrances",
                                style: TextStyle(
                                    fontFamily: ('homePage'), fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            )
          ],
        ));
  }
}
