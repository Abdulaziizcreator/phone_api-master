import 'package:flutter/material.dart';
import 'package:phone_api/pages/category.dart';

import '../model/model.dart';
import '../service/service.dart';

class Laptops extends StatefulWidget {
  static const String id = 'laptops';

  Laptops({super.key});

  @override
  State<Laptops> createState() => _LaptopsState();
}

class _LaptopsState extends State<Laptops> {
  List items = [];
  String category = 'laptops';
  bool isLoading = false;
  List<Product> sortedList = [];

  List<Product> parsingLaptops(String category) {
    ProductService.GET(ProductService.GET_API, ProductService.paramsGet())
        .then((response) => {
      setState(() {
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
    parsingLaptops(category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomePage.id);
                },
                icon: Icon(Icons.navigate_next_sharp))
          ],
        ),
        body: sortedList.isNotEmpty
            ? RefreshIndicator(
            child: ListView.builder(
                itemCount: sortedList.length,
                itemBuilder: (ctx, index) {
                  return categor(sortedList[index]);
                }),
            onRefresh: () async {})
            : Center(child: CircularProgressIndicator()));
  }

  Widget categor(Product product) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.thumbnail),
                )),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Center(
                  child: Text(
                    product.title,
                    style: TextStyle(fontSize: 30, fontFamily: 'homePage'),
                  )),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
