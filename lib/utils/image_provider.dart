import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CachedImageContainer extends StatelessWidget {
  final String imgUrl;
  final double borderRadius;

  const CachedImageContainer({
    Key? key,
    required this.imgUrl,
    this.borderRadius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        width: double.infinity,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        imageUrl: imgUrl,
        placeholder: (context, url) => FittedBox(
          fit: BoxFit.cover,
          child: Image.asset(
            "assets/images/news-placeholder.jpg",
          ),
        ),
        errorWidget: (context, url, error) => FittedBox(
          fit: BoxFit.cover,
          child: Image.asset("assets/images/news-placeholder.jpg"),
        ),
      ),
    );
  }
}
