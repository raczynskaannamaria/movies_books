import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_books/core/resources/app_colors.dart';
import 'package:movies_books/core/resources/app_text.dart';
import 'package:movies_books/core/util/enums.dart';
import 'package:movies_books/domain/entities/details_entity.dart';
import 'package:movies_books/domain/entities/genre_entity.dart';
import 'package:movies_books/presentation/movie/bloc/details_bloc.dart';

class TextDetailsComponent extends StatelessWidget {
  const TextDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsEntity? movie;

    return BlocBuilder<DetailsBloc, DetailsState>(builder: (context, state) {
      movie = state.detailsEntity;
      switch (state.state) {
        case RequestState.loading:
          return const SizedBox(
            child: Center(child: CircularProgressIndicator()),
          );
        case RequestState.loaded:
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Texts.text1(
                          string: movie!.title, color: AppColor.cello)),
                  _showRate(movie: movie),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 20,
                child: _movieGenres(movie!.genres!),
              ),
              SizedBox(height: 20),
              Container(
                child: Text(movie!.overview!),
              ),
            ],
          );
        case RequestState.error:
          return Container(
            child: Center(child: Icon(Icons.error)),
          );
      }
    });
  }
}

Widget _movieGenres(List<GenreEntity> genres) {
  return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Chip(
          labelPadding: EdgeInsets.all(10),
          label: Text(genres[index].name.toString()),
          backgroundColor: AppColor.burntSienna,
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(width: 7),
      itemCount: genres.length);
}

Row _showRate({DetailsEntity? movie}) {
  return Row(
    children: [
      Text(movie!.voteAverage.toString()),
      const SizedBox(
        width: 5,
      ),
      const Icon(
        Icons.star_border_outlined,
        color: AppColor.sandyBrown,
      )
    ],
  );
}

/*return Center(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Texts.text1(
                                string: movie!.title, color: AppColor.cello)),
                        _showRate(movie: movie),
                      ],
                    ),
                    Container(
                      height: 20,
                      child: _movieGenres(movie!.genres!),
                    ),
                    SizedBox(
                      child: Text(movie!.overview!),
                    ),
                  ],
                ),
              ),
            ),
          );
        case RequestState.error:
          return Container(
            child: Center(child: Icon(Icons.error)),
          );
      }*/

