import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/src/features/home/data/entity/product_model.dart';

class CardDetailPage extends StatelessWidget {
  const CardDetailPage({super.key, required this.productModel});
  final ProductModel productModel;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Action Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {},
                    ),
                  ),
                  const Text(
                    "Product Detail",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: const CircleBorder(side: BorderSide(color: Colors.black)),
                    child: const Icon(Icons.favorite_border),
                  ),
                ],
              ),

              // Image Carousel
          Image.network("https://i.pinimg.com/564x/b3/74/21/b374218190f8c91d0dac55ad643d046c.jpg"),


              const SizedBox(height: 10),
              // Rating
              Row(
                children: [
                  Text("${productModel.rating!.count} ★", style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 10),
                  Text(productModel.title.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),

              const SizedBox(height: 5),
              // Product Description
              const Text("Product Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(productModel.description.toString(), style: const TextStyle(fontSize: 14)),

              const SizedBox(height: 15),
              // Size Selection
              const Text("Select Size", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'].map((size) {
                  return ChoiceChip(
                    label: Text(size),
                    selected: false,
                    onSelected: (selected) {},
                  );
                }).toList(),
              ),

              const SizedBox(height: 15),
              // Color Selection
              const Text("Select Color :", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildColorOption(Colors.brown),
                  const SizedBox(width: 10),
                  _buildColorOption(Colors.black),
                  const SizedBox(width: 10),
                  _buildColorOption(Colors.white),
                  const SizedBox(width: 10),
                  _buildColorOption(Colors.orange),
                ],
              ),

              const SizedBox(height: 20),
              // Total Price
              Text("Total Price: \$${productModel.price}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              // Add to Cart Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),

                ),
                child: const Text("Add to Cart"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    return GestureDetector(
      onTap: () {
        // Handle color selection
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
        ),
      ),
    );
  }
}



