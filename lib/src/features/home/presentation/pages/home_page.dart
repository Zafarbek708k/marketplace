import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/src/features/home/bloc/home_bloc.dart';
import 'package:marketplace/src/features/home/data/entity/product_model.dart';
import 'package:marketplace/src/features/home/data/repository/home_repository.dart';
import 'package:marketplace/src/features/home/presentation/pages/card_detail_page.dart';
import 'package:marketplace/src/features/home/presentation/widgets/girdview_item_widget.dart';
import 'package:marketplace/src/features/home/presentation/widgets/home_banner_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/home_search_widget.dart';
import '../widgets/home_top_location_widget.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

   HomeRepository homeRepository = HomeRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final homeBloc = context.read<HomeBloc>();

          return Scaffold(
            body: Padding(
              padding: REdgeInsets.symmetric(horizontal: 12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    HomeTopLocationWidget(state: state, notificationPressed: ()async{await homeRepository.getData();},),
                    HomeSearchWidget(controller: TextEditingController(), filterPressed: () {}),
                    SizedBox(
                      height: 250.h,
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: homeBloc.bannerController,
                            itemCount: homeBloc.bannerImages.length,
                            itemBuilder: (context, index) {
                              log(homeBloc.bannerImages[0]);
                              return Padding(
                                padding: REdgeInsets.symmetric(horizontal: 8),
                                child: HomeBannerWidget(
                                  imageUrl: homeBloc.bannerImages[index],
                                  bannerText: "Get your 30% daily \n discount now!",
                                ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: SmoothPageIndicator(
                                controller: homeBloc.bannerController,
                                count: homeBloc.bannerImages.length,
                                effect: const ExpandingDotsEffect(
                                  dotHeight: 8,
                                  dotWidth: 8,
                                  activeDotColor: Colors.black,
                                  dotColor: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Category",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.orange.withOpacity(0.1),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "    See all    ",
                              style: TextStyle(
                                color: Colors.brown,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              MaterialButton(
                                shape: const CircleBorder(side: BorderSide(color: Colors.black)),
                                onPressed: () {},
                                child: const Icon(Icons.man),
                              ),
                              Text("${index + 1} - image")
                            ],
                          );
                        },
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Flash Sale"), Text("Closing in Time")],
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeBloc.categoryList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              shape: const StadiumBorder(side: BorderSide(color: Colors.black)),
                              onPressed: () {},
                              child: Text(
                                homeBloc.categoryList[index],
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    /// card items GridView
                    SizedBox(
                      height: 600,
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of items in a row
                          crossAxisSpacing: 1, // Spacing between the items horizontally
                          mainAxisSpacing: 1.0, // Spacing between the items vertically
                          childAspectRatio: 0.5, // Aspect ratio of each item
                        ),
                        itemCount: products.length, // Replace with the actual number of items
                        itemBuilder: (context, index) {
                          ProductModel product = products[index];
                          return GridViewCardItem(product: product, onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> CardDetailPage(productModel: product,)));
                          },);
                        },
                      ),
                    ),
                    SizedBox(height: 120.h)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



List<ProductModel> products = [
  ProductModel(
    id: 1,
    title: "Wireless Headphones",
    price: 99.99,
    description: "High-quality wireless headphones with noise cancellation.",
    category: Category.ELECTRONICS,
    image: "https://example.com/images/headphones.jpg",
    rating: Rating(rate: 4.5, count: 5),
  ),
  ProductModel(
    id: 2,
    title: "Running Shoes",
    price: 79.99,
    description: "Lightweight running shoes with breathable material.",
    category: Category.ELECTRONICS,
    image: "https://example.com/images/shoes.jpg",
    rating: Rating(rate: 4.5, count: 5),
  ),
  ProductModel(
    id: 3,
    title: "Smartwatch",
    price: 149.99,
    description: "Smartwatch with heart rate monitor and GPS.",
    category: Category.WOMEN_S_CLOTHING,
    image: "https://example.com/images/smartwatch.jpg",
    rating: Rating(rate: 4.5, count: 5),
  ),
  ProductModel(
    id: 4,
    title: "Gaming Chair",
    price: 199.99,
    description: "Ergonomic gaming chair with adjustable features.",
    category: Category.JEWELERY,
    image: "https://example.com/images/gaming_chair.jpg",
    rating: Rating(rate: 4.5, count: 5),
  ),
  ProductModel(
    id: 5,
    title: "Coffee Maker",
    price: 49.99,
    description: "Compact coffee maker with programmable settings.",
    category: Category.JEWELERY,
    image: "https://example.com/images/coffee_maker.jpg",
    rating: Rating(rate: 4.5, count: 5),
  ),
  ProductModel(
    id: 6,
    title: "Yoga Mat",
    price: 19.99,
    description: "Non-slip yoga mat with comfortable cushioning.",
    category: Category.JEWELERY,
    image: "https://example.com/images/yoga_mat.jpg",
    rating: Rating(rate: 4.5, count: 5),
  ),
  ProductModel(
    id: 7,
    title: "LED Desk Lamp",
    price: 29.99,
    description: "Energy-efficient LED desk lamp with adjustable brightness.",
    category: Category.JEWELERY,
    image: "https://example.com/images/desk_lamp.jpg",
    rating: Rating(rate: 4.5, count: 5),
  ),
  ProductModel(
    id: 8,
    title: "Bluetooth Speaker",
    price: 59.99,
    description: "Portable Bluetooth speaker with deep bass and long battery life.",
    category: Category.JEWELERY,
    image: "https://example.com/images/bluetooth_speaker.jpg",
    rating: Rating(rate: 4.5, count: 5),
  ),
  ProductModel(
    id: 9,
    title: "Pressure Cooker",
    price: 89.99,
    description: "Multi-functional pressure cooker with preset cooking programs.",
    category: Category.WOMEN_S_CLOTHING,
    image: "https://example.com/images/pressure_cooker.jpg",
    rating: Rating(rate: 4.5, count: 5),
  ),
  ProductModel(
    id: 10,
    title: "Fitness Tracker",
    price: 39.99,
    description: "Wearable fitness tracker with sleep monitoring and step counting.",
    category: Category.JEWELERY,
    image: "https://example.com/images/fitness_tracker.jpg",
    rating: Rating(rate: 4.5, count: 5),
  ),
];
