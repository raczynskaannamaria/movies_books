import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_books/core/util/api_constants.dart';
import 'package:movies_books/core/util/enums.dart';
import 'package:movies_books/presentation/movie/bloc/movie_bloc.dart';
import 'package:shimmer/shimmer.dart';

class UpcomingComponent extends StatelessWidget {
  const UpcomingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.upcomingState != current.upcomingState,
      builder: (context, state) {
        switch (state.upcomingState) {
          //if loading
          case RequestState.loading:
            return const SizedBox(
              height: 170.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return Container(
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.upcomingMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.upcomingMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl:
                                ApiConstants.image_URL(movie.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 170.0,
              child: Center(
                child: Text(state.upcomingMessage),
              ),
            );
        }
      },
    );
  }
}
