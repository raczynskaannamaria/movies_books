import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_books/core/resources/app_colors.dart';
import 'package:movies_books/core/resources/app_text.dart';
import 'package:movies_books/core/services/service_locator.dart';
import 'package:movies_books/core/util/api_constants.dart';
import 'package:movies_books/core/util/enums.dart';
import 'package:movies_books/core/widgets/movies_list.dart';
import 'package:movies_books/core/widgets/title_section.dart';
import 'package:movies_books/domain/entities/movie_entity.dart';
import 'package:movies_books/presentation/movie/bloc/movie_bloc.dart';
import 'package:movies_books/presentation/movie/pages/search_page.dart';
import 'package:shimmer/shimmer.dart';

class MoviePageContent extends StatelessWidget {
  const MoviePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<MovieBloc>()
          ..add(GetTrendingEvent())
          ..add(GetLatestEvent())
          ..add(GetTopRatedEvent())
          ..add(GetUpcomingEvent()),
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
          SearchSection(list: []),
          const TitleSection(title: 'TRENDING', isLoading: true),
          BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              switch (state.trendingState) {
                case RequestState.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                case RequestState.loaded:
                  return MoviesList(list: state.trendingMovies);

                case RequestState.error:
                  return const Center(
                    child: Text("Error"),
                  );
              }
            },
          ),
          const TitleSection(title: "LATEST RELEASES", isLoading: true),
          BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
            switch (state.latestState) {
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.loaded:
                return MoviesList(list: state.latestMovies);
              case RequestState.error:
                return const Center(
                  child: Text("Error"),
                );
            }
          }),
          const TitleSection(title: "TOP RATED", isLoading: true),
          BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
            switch (state.topRatedState) {
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.loaded:
                return MoviesList(list: state.topRatedMovies);
              case RequestState.error:
                return const Center(
                  child: Text("Error"),
                );
            }
          }),
          const TitleSection(title: "UPCOMING", isLoading: true),
          BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
            switch (state.upcomingState) {
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.loaded:
                return MoviesList(list: state.upcomingMovies);
              case RequestState.error:
                return const Center(
                  child: Text("Error"),
                );
            }
          }),
        ]))));
  }
}

class SearchSection extends StatelessWidget {
  final List<MovieEntity> list;
  const SearchSection({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ));
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                color: AppColor.alto,
                child: ListTile(
                  leading: Icon(Icons.search_outlined),
                  title: Texts.text2(
                      string: "Find a movie", color: AppColor.waterloo),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
