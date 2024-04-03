import 'package:flutter/material.dart';
class SmartphonesImages extends StatefulWidget {
  const SmartphonesImages({super.key});

  @override
  State<SmartphonesImages> createState() => _SmartphonesImagesState();
}

class _SmartphonesImagesState extends State<SmartphonesImages> {
  List<String> imageUrls = [];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imageUrls.length, // Use the length of imageUrls list
      itemBuilder: (context, index) {
        return Image.network(
          imageUrls[index], // Get the URL at the current index
          fit: BoxFit.cover, // Adjust image size to cover the container
          width: double.infinity, // Set image width to fill the container
          height: 200, // Set a fixed height for the image
        );
      },
    );
  }
}
