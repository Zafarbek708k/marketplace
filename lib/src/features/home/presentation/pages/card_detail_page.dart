import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/src/features/auth/widgets/auth_common_button_widget.dart';
import 'package:marketplace/src/features/home/data/entity/product_model.dart';

import '../../data/repository/home_repository.dart';

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
              SizedBox(height: 50.h),
              // Top Action Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    shape: const CircleBorder(side: BorderSide(color: Colors.black)),
                    child: const Icon(Icons.arrow_back),
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

              Center(
                child: CachedNetworkImage(
                  imageUrl: productModel.image!,
                  width: double.infinity,
                  height: 250.h,
                  fit: BoxFit.contain,
                  placeholder: (context, url) =>
                      Container(
                        width: double.infinity,
                        height: 150.h,
                        color: Colors.grey[300],
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                  errorWidget: (context, url, error) =>
                      Container(
                        width: double.infinity,
                        height: 170.h,
                        color: Colors.grey[300],
                        child: Center(child: Icon(Icons.error, color: Colors.red[400])),
                      ),
                ),
              ),

              const SizedBox(height: 10),
              // Rating

              Text("Product Rating ${productModel.rating!.count} ★", style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 10),
              Text("Product title: ${productModel.title}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

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

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text("Total Price\n \$${productModel.price}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    flex: 5,
                    child: AuthCommonButton(
                        onPressed: () async {
                          await HomeRepository.postData(product: productModel).then((response) {
                            log("card detail add to card button is working");
                          }).catchError(
                                (error) {},
                          );
                        },
                        text: "Add to Cart"),
                  )
                ],
              ),

              SizedBox(height: 60.h)
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
