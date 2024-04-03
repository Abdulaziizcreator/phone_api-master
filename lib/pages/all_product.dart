import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:phone_api/model/model.dart';

import '../service/service.dart';
import 'get_details.dart';

class AllProduct extends StatefulWidget {
  static const String id = 'all_product';

  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  var logger = Logger();
  List items = [];
  bool isLoading = false;

  deleteDataFromUI(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void parsingData() {
    ProductService.GET(ProductService.GET_API, ProductService.paramsGet())
        .then((response) => {
              setState(() {
                logger.w(response);
                items = ProductService.parsingResponse(response!);
              }),
            });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    parsingData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC1DADF),
      appBar: AppBar(
        title: Text(
          'ALL PRODUCT',
          style: TextStyle(fontFamily: 'homePage', fontSize: 38),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, GetDetails.id);
              }, icon: Icon(CupertinoIcons.person_add_solid))
        ],
        centerTitle: true,
        backgroundColor: Color(0xFF2FC4B2),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
      ),
      body: items.isNotEmpty
          ? RefreshIndicator(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (ctx, index) {
                    return _getInfo(items[index]);
                  }),
              onRefresh: () async {
                parsingData();
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget _getInfo(Product product) {
    return GestureDetector(
      onTap: () {},
      child: Container(
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
                Expanded(child: Container()),
                TextButton(
                    onPressed: () {
                      setState(() {
                        deleteDataFromUI(product.id);
                      });
                    },
                    child: const Text(
                      'Not Interested',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ))
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
