import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_books/core/resources/app_colors.dart';
import 'package:movies_books/core/resources/app_text.dart';
import 'package:movies_books/core/util/api_constants.dart';
import 'package:movies_books/core/util/enums.dart';
import 'package:movies_books/domain/entities/details_entity.dart';
import 'package:movies_books/presentation/movie/bloc/details_bloc.dart';
import 'package:shimmer/shimmer.dart';


class MovieDetailsComponent extends StatelessWidget {
  const MovieDetailsComponent({Key? key});

  @override
  Widget build(BuildContext context) {
    DetailsEntity? movie;
    return BlocBuilder<DetailsBloc, DetailsState>(builder: (context, state) {
      movie = state.detailsEntity;
      switch (state.state) {
        case RequestState.loading:
          return const SizedBox(
              child: Center(child: CircularProgressIndicator()));
        case RequestState.loaded:
          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 360,
              width: 230,
              child: Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: ApiConstants.image_URL(movie!.posterPath!),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error_outline),
                    ),
                  ),
                ),
              ]),
            ),
          );
        case RequestState.error:
          return Container(child: Center(child: Icon(Icons.error)));
        default:
          return Container();
      }
    });
  }
}

    
    
    


    
 






/*class MovieDetailsComponent extends StatelessWidget {
  const MovieDetailsComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DetailsEntity? movie;
    return BlocBuilder<DetailsBloc, DetailsState>(builder: (context, state) {
      movie = state.detailsEntity;
      switch (state.state) {
        case RequestState.loading:
          return Container(
              child: SizedBox(
                  height: 170,
                  child: const Center(child: CircularProgressIndicator())));
        case RequestState.loaded:
          return AppBar(
              leadingWidth: 25,
              title: Texts.text2(
                  string: movie?.title ?? '', color: AppColor.cello),
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_left_outlined)),
              actions: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.bookmark_outline,
                    color: Colors.white,
                  ),
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                background: CachedNetworkImage(
                    imageUrl: ApiConstants.image_URL(movie!.backdropPath!),
                    placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(color: Colors.white),
                        ),
                    errorWidget: (context, url, error) => const Center(
                          child: Icon(Icons.error_outline),
                        ),
                    fit: BoxFit.cover),
              ));
        case RequestState.error:
          return Container(child: Center(child: Icon(Icons.error)));
        default:
          return Container();
      }
    });
  }
}*/
