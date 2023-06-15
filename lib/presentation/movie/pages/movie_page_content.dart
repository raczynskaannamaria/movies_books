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
import 'package:movies_books/presentation/movie/bloc/search/search_bloc.dart';
import 'package:movies_books/presentation/movie/pages/search_page.dart';
import 'package:shimmer/shimmer.dart';

class MoviePageContent extends StatelessWidget {
  const MoviePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<MovieBloc>()
              ..add(GetTrendingEvent())
              ..add(GetLatestEvent())
              ..add(GetTopRatedEvent())
              ..add(GetUpcomingEvent()),
          ),
          BlocProvider(create: (context) => getIt<SearchBloc>())
        ],
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
          SearchSection(),
          TitleSection(type: 1, title: 'TRENDING'),
          TitleSection(type: 2, title: 'LATEST RELEASES'),
          TitleSection(type: 3, title: 'TOP RATED'),
          TitleSection(type: 4, title: 'UPCOMING'),
        ]))));
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showSearch(
                context: context,
                delegate: SearchPage(
                  BlocProvider.of<SearchBloc>(context),
                ),
              );
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
