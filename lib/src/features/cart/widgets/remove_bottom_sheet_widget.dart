import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketplace/src/features/cart/bloc/card_bloc.dart';
import 'package:marketplace/src/features/home/data/entity/product_post_model.dart';


class RemoveBottomSheet extends StatelessWidget {
  const RemoveBottomSheet({super.key, required this.item});
  final ProductPostModel item;

  @override
  Widget build(BuildContext context) {
    return Container(); // Placeholder widget because showModalBottomSheet can't be returned directly.
  }

  static void show(BuildContext context, ProductPostModel item) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return BlocProvider(
          create: (context) => CardBloc(),
          child: BlocBuilder<CardBloc, CardState>(
            builder: (context, state) {
              return Padding(
                padding: REdgeInsets.all(18.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Remove from Cart?", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10.h),
                    ListTile(
                      leading: Container(
                        height: 60.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(item.image!)),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      title: Text(item.title!.substring(0, 15) ?? "No name", style: TextStyle(fontSize: 16.sp)),
                      subtitle: Text("\$${item.price ?? '0'}", style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            backgroundColor: Colors.grey.shade300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel", style: TextStyle(color: Colors.black)),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            backgroundColor: Colors.brown,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          onPressed: () {

                            context.read<CardBloc>().add(DeleteBasketItem(list: [item]));
                            context.read<CardBloc>().add(const GetBasketProductList(list: []));

                            Navigator.pop(context);
                          },
                          child: const Text("Yes, Remove", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
