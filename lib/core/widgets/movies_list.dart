import 'package:flutter/cupertino.dart';
import 'package:movies_books/core/resources/app_colors.dart';
import 'package:movies_books/core/widgets/image_container.dart';
import 'package:movies_books/domain/entities/movie_entity.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        padding: EdgeInsets.only(left: 16),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => const ImageContainer(image_URL: 'https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg'),
        ));
  }
}
