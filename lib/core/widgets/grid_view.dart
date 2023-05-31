import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_books/core/resources/app_colors.dart';
import 'package:movies_books/core/util/api_constants.dart';
import 'package:movies_books/domain/entities/movie_entity.dart';
import 'package:movies_books/presentation/movie/pages/details_page.dart';
import 'package:shimmer/shimmer.dart';

Container buildMovieGrid({required List<MovieEntity> movie}) {
  return Container(
    margin: EdgeInsets.only(top: 15),
    child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: movie.length,
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 8, childAspectRatio: 1),
        itemBuilder: (context, index) => SizedBox(
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(movieId: movie[index].id)));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                      imageUrl: ApiConstants.image_URL(movie[index].posterPath),
                      fit: BoxFit.fill),
                )))),
  );
}
