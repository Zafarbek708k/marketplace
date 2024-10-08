// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class ConnectivityWidget extends StatefulWidget {
//   final Widget child;
//
//   const ConnectivityWidget({super.key, required this.child});
//
//   @override
//   ConnectivityWidgetState createState() => ConnectivityWidgetState();
// }
//
// class ConnectivityWidgetState extends State<ConnectivityWidget> {
//   bool _isBottomSheetShown = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<ConnectivityBloc, ConnectivityState>(
//       listener: (context, state) {
//         if (state is ConnectivityDisconnected && !_isBottomSheetShown) {
//           _showNoInternetConnectionBottomSheet(context);
//         } else if (state is ConnectivityConnected && _isBottomSheetShown) {
//           _dismissNoInternetConnectionBottomSheet(context);
//         }
//       },
//       child: widget.child,
//     );
//   }
//
//   void _showNoInternetConnectionBottomSheet(BuildContext context) {
//     _isBottomSheetShown = true;
//     showModalBottomSheet(
//       backgroundColor: Colors.white,
//       context: context,
//       isDismissible: false,
//       enableDrag: false,
//       builder: (_) => const NoInternetConnectionBottomSheet(),
//     ).whenComplete(() {
//       _isBottomSheetShown = false;
//       _checkConnectivityAgain(context);
//     });
//   }
//
//   void _checkConnectivityAgain(BuildContext context) {
//     final state = context.read<ConnectivityBloc>().state;
//     if (state is ConnectivityDisconnected) {
//       _showNoInternetConnectionBottomSheet(context);
//     }
//   }
//
//   void _dismissNoInternetConnectionBottomSheet(BuildContext context) {
//     if (_isBottomSheetShown) {
//       Navigator.pop(context);
//       _isBottomSheetShown = false;
//     }
//   }
// }
//
// class NoInternetConnectionBottomSheet extends StatelessWidget {
//   const NoInternetConnectionBottomSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 24,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const CustomStickWidget(),
//             const Spacer(),
//             SvgPicture.asset(Assets.imagesWifiOff),
//             const Spacer(),
//             Text(
//               context.localized.lost_internet_connection,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             const Spacer(),
//             CustomNextButtonWidget(
//               text: context.localized.try_again,
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
