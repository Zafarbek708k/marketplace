import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({super.key, required this.imageUrl, required this.bannerText});
  final String imageUrl;
  final String bannerText;

  @override
  Widget build(BuildContext context) => Container(
    margin:  REdgeInsets.symmetric(vertical: 16, horizontal: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: double.infinity,
            height: 200.h,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              width: double.infinity,
              height: 150.h,
              color: Colors.grey[300],
              child: const Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) => Container(
              width: double.infinity,
              height: 170.h,
              color: Colors.grey[300],
              child: Center(child: Icon(Icons.error, color: Colors.red[400])),
            ),
          ),
        ),
        // Banner text and button
        Padding(
          padding: REdgeInsets.all(8),
          child: Text(
            bannerText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}



