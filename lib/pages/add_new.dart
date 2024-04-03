import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:phone_api/model/model.dart';
import 'package:phone_api/service/service.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  var logger = Logger();
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountPercentageController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController thumbnallController = TextEditingController();
  List image67s = [];

  Future<void> _post() async {
    int id = int.parse(idController.text.trim());
    String title = titleController.text.trim();

    String description = descriptionController.text.trim();
    int price = int.parse(priceController.text.trim());
    var discountPercentage;
    var rating;
    int stock = int.parse(stockController.text.trim());
    String brand = brandController.text.trim();
    String category = categoryController.text.trim();
    String thumbnail = thumbnallController.text.trim();
    List<dynamic> images;
    Product product = Product(
      id: id,
      title: title,
      description: description,
      price: price,
      discountPercentage: discountPercentage,
      rating: rating,
      stock: stock,
      brand: brand,
      category: category,
      thumbnail: thumbnail,
      images: image67s,
    );

    var response = await ProductService.POST(
        ProductService.POST_API, ProductService.paramsPost(product: product));
    logger.w(response);
    makeEmpty();
  }

  void makeEmpty() {
    idController.clear();
    titleController.clear();
    descriptionController.clear();
    discountPercentageController.clear();
    priceController.clear();
    ratingController.clear();
    stockController.clear();
    brandController.clear();
    categoryController.clear();
    thumbnallController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),

      ),
      body: ListView(
        children: [
          Padding (
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextField(
                    controller: idController,
                    decoration: InputDecoration(
                      hintText: 'id(number)',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'title',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      hintText: 'description',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                      hintText: 'price(number)',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextField(
                    controller: discountPercentageController,
                    decoration: InputDecoration(
                      hintText: 'discountPercentage',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextField(
                    controller: ratingController,
                    decoration: const InputDecoration(
                      hintText: 'rating',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextField(
                    controller: stockController,
                    decoration: const InputDecoration(
                      hintText: 'stock(number)',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextField(
                    controller: brandController,
                    decoration: const InputDecoration(
                      hintText: 'brand',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextField(
                    controller: categoryController,
                    decoration: const InputDecoration(
                      hintText: 'category',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300,
                  ),
                  child: TextField(
                    controller: thumbnallController,
                    decoration: const InputDecoration(
                      hintText: 'thumbnail',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _post();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.teal, // Change the background color here
                  ),
                  child: const Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
