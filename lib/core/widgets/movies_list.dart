import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_books/core/resources/app_colors.dart';
import 'package:movies_books/core/util/api_constants.dart';
import 'package:movies_books/core/widgets/image_container.dart';
import 'package:movies_books/domain/entities/movie_entity.dart';
import 'package:movies_books/presentation/movie/pages/details_page.dart';

class MoviesList extends StatelessWidget {
  final List<MovieEntity> list;
  const MoviesList({required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        padding: EdgeInsets.only(left: 16),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailsPage(movieId: list[index].id,)));
              },
              child: ImageContainer(
                  image_URL: ApiConstants.image_URL(list[index].posterPath),
                  rate: list[index].voteAverage)),
        ));
  }
}
