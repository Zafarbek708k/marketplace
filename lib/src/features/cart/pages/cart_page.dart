import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:marketplace/src/features/cart/bloc/card_bloc.dart';
import '../widgets/checkout_bottom_sheet_widget.dart';
import '../widgets/remove_bottom_sheet_widget.dart';




class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardBloc()..add(const GetBasketProductList(list: [])),
      child: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          if (state.cardPageState == CardPageState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.cardPageState == CardPageState.error) {
            return const Center(child: Text('No Data '));
          } else if (state.cardPageState == CardPageState.success) {
            return Scaffold(
              body: Column(
                children: [
                  SizedBox(height: 50.h),
                  Center(child: Text("My Carts", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp))),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.basketList.length,
                      itemBuilder: (context, index) {
                        final item = state.basketList[index];
                        return Padding(
                          padding: REdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                          child: Slidable(
                            key: ValueKey(item.id),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) => RemoveBottomSheet.show(context, item),
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            child: CupertinoButton(
                              onPressed: () => CheckOutBottomSheet.show(context),
                              child: Row(
                                children: [
                                  Container(
                                    height: 120.h,
                                    width: 120.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.r),
                                      image: DecorationImage(image: NetworkImage(item.image!))
                                    ),
                                  ),
                                  SizedBox(width: 15.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(item.title!.substring(0, 10), style: TextStyle(fontSize: 18.sp)),
                                      Text("Rating: ${item.rating!.rate}", style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
                                      Text("\$${item.price}", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25.r),
                                          border: Border.all(color: Colors.grey),
                                        ),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.remove),
                                            ),
                                            Text('1', style: TextStyle(fontSize: 16.sp)),
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.add),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 100.h)
                ],
              ),
            );
          }
          return const SizedBox(); // fallback in case the state is in `init`
        },
      ),
    );

  }
}



