import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_books/core/resources/app_colors.dart';
import 'package:movies_books/core/resources/app_text.dart';
import 'package:shimmer/shimmer.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.title, required this.isLoading});

  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTitle(context),
            _buildSeeAll(context),
          ],
        ));
  }

  Widget _buildTitle(BuildContext context) {
    if (isLoading) {
      return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Texts.text2(string: title));
    } else {
      return Texts.text2(string: title);
    }
  }

  Widget _buildSeeAll(BuildContext context) {
    if (isLoading) {
      return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: const Text(
            'See all',
            style: TextStyle(color: AppColor.cello),
          ));
    } else {
      return Text('See all', style: TextStyle(color: AppColor.cello));
    }
  }
}
