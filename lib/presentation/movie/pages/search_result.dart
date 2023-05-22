import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_books/core/resources/app_text.dart';
import 'package:shimmer/shimmer.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // to finish
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 15),
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white70,
                ),
                margin: EdgeInsets.all(16),
                height: 130,
              ),
              Positioned(
                left: 30,
                top: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 110,
                        height: 150,
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                    width: 110,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 160,
                top: 0,
                bottom: 0,
                child: SizedBox(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Texts.text2(string: 'Title'),
                      SizedBox(height: 40),
                      Texts.text2(string: "Popularity"),
                      Texts.text2(string: "Release"),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
