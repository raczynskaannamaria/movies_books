import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_books/core/resources/app_colors.dart';
import 'package:movies_books/core/resources/app_text.dart';
import 'package:movies_books/core/services/service_locator.dart';
import 'package:movies_books/core/util/api_constants.dart';
import 'package:movies_books/core/util/enums.dart';
import 'package:movies_books/domain/entities/movie_entity.dart';
import 'package:movies_books/presentation/movie/bloc/movie_bloc.dart';
import 'package:movies_books/presentation/movie/bloc/search/search_bloc.dart';
import 'package:movies_books/presentation/movie/pages/details_page.dart';
import 'package:shimmer/shimmer.dart';

//search result

class MovieListCard extends StatelessWidget {
  final MovieEntity movie;
  const MovieListCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(movieId: movie.id)));
      },
      child: SizedBox(
          height: 160,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.alto),
              margin: EdgeInsets.all(16),
              height: 140,
            ),
            Positioned(
              left: 35,
              top: 0,
              bottom: 0,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child:  CachedNetworkImage(
                  imageUrl: ApiConstants.image_URL(movie.posterPath),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                 
                  width: 110,
                  height: 150,
                  fit: BoxFit.cover,
                   errorWidget: (context, url, error) => new Icon(Icons.error)
                ),

                      /* FadeInImage(
                    image:
                        NetworkImage(ApiConstants.image_URL(movie.posterPath)),
                    placeholder: AssetImage('assets/icons/loading.jpg'),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/icons/noimage.jpg',
                          fit: BoxFit.fitWidth);
                    },
                    fit: BoxFit.fitWidth,
                  ), */
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
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(height: 20),
                    Text(
                      movie.popularity.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      movie.releaseDate,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ])),
    );
  }

  /*return BlocProvider(
      create: (context) => getIt<SearchBloc>()..add(GetSearchEvent(query: )),
      child:
          /* GestureDetector(
                      onTap: () {
                       Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(movieId: movieId)));
                      },
                      child: */
          BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          switch (state.movies) {
            case RequestState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestState.loaded:
             final List<MovieEntity> searchResults = state.movies;
              return ListView.builder(
                shrinkWrap:  true,
                  itemCount: list.length,
                 scrollDirection: Axis.vertical,
                 physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                     final movie = searchResults[index];
                    return Stack(
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
                          left: 35,
                          top: 0,
                          bottom: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: ApiConstants.image_URL(
                                  list[index].posterPath),
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
                                Texts.text2(string: "Title"),
                                SizedBox(height: 40),
                                Texts.text2(string: "Popularity"),
                                Texts.text2(string: "Release"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            case RequestState.error:
              return const Center(
                child: Text("Error"),
              );
          }
        },
      ),
    );
  }*/
}
