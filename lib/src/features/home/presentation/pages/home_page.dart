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
import '../../data/entity/category_model.dart';
import '../widgets/home_search_widget.dart';
import '../widgets/home_top_location_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetProductList(list: [])),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final homeBloc = context.read<HomeBloc>();

          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40.h),

                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 10.0),
                    child: HomeTopLocationWidget(
                      state: state,
                      notificationPressed: () async {
                        await HomeRepository.getData();
                      },
                    ),
                  ),

                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 10.0),
                    child: HomeSearchWidget(controller: TextEditingController(), filterPressed: () {}),
                  ),

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
                                bannerText: "",
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
                      itemCount:  categoryList.length,
                      itemBuilder: (context, index) {
                        var item =  categoryList[index];
                        return Column(
                          children: [
                            MaterialButton(
                              shape: const CircleBorder(side: BorderSide(color: Colors.black)),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    height: 50.h,
                                    child: Image.asset(item.image!)),
                              ),
                            ),
                            Text("${item.title}", style: const TextStyle(fontWeight: FontWeight.bold),)
                          ],
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: REdgeInsets.only(left: 20.0, right: 20, bottom: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Flash Sale", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        Text("Closing in Time", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeBloc.categoryList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                      itemCount: faceProducts.length, // Replace with the actual number of items
                      itemBuilder: (context, index) {
                        if (state.homePageState == HomePageState.success) {
                          ProductModel product = state.productList[index];
                          return GridViewCardItem(
                            product: product,
                            onPressed: (){Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CardDetailPage(
                                  productModel: product,
                                ),
                              ),
                            );
                            },
                          );
                        } else if (state.homePageState == HomePageState.loading) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          ProductModel product = faceProducts[index];
                          return GridViewCardItem(
                            product: product,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CardDetailPage(
                                    productModel: product,
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 120.h)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

List<ProductModel> faceProducts = [
  ProductModel(id: 0, title: "", price: 0, description: "", category: Category.ELECTRONICS, image: "", rating: Rating(rate: 0, count: 0)),
  ProductModel(id: 0, title: "", price: 0, description: "", category: Category.ELECTRONICS, image: "", rating: Rating(rate: 0, count: 0)),
  ProductModel(id: 0, title: "", price: 0, description: "", category: Category.ELECTRONICS, image: "", rating: Rating(rate: 0, count: 0)),
  ProductModel(id: 0, title: "", price: 0, description: "", category: Category.ELECTRONICS, image: "", rating: Rating(rate: 0, count: 0)),
  ProductModel(id: 0, title: "", price: 0, description: "", category: Category.ELECTRONICS, image: "", rating: Rating(rate: 0, count: 0)),
  ProductModel(id: 0, title: "", price: 0, description: "", category: Category.ELECTRONICS, image: "", rating: Rating(rate: 0, count: 0)),
  ProductModel(id: 0, title: "", price: 0, description: "", category: Category.ELECTRONICS, image: "", rating: Rating(rate: 0, count: 0)),
  ProductModel(id: 0, title: "", price: 0, description: "", category: Category.ELECTRONICS, image: "", rating: Rating(rate: 0, count: 0)),
  ProductModel(id: 0, title: "", price: 0, description: "", category: Category.ELECTRONICS, image: "", rating: Rating(rate: 0, count: 0)),
  ProductModel(id: 0, title: "", price: 0, description: "", category: Category.ELECTRONICS, image: "", rating: Rating(rate: 0, count: 0)),
];
