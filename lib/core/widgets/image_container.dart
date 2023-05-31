import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_books/core/resources/app_colors.dart';
import 'package:movies_books/core/util/api_constants.dart';
import 'package:shimmer/shimmer.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({Key? key, required this.image_URL, required this.rate})
      : super(key: key);

  final String image_URL;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160,
        width: 140,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: ApiConstants.image_URL(image_URL),
                fit: BoxFit.fill,
                width: 130,
                placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.white,
                    )),
                errorWidget: (context, url, error) => Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
            Positioned(
              top: 8.0,
              left: 8.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColor.burntSienna,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  '$rate',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
