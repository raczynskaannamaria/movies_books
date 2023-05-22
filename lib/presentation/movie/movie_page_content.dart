import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_books/core/resources/app_colors.dart';
import 'package:movies_books/core/resources/app_text.dart';
import 'package:movies_books/core/services/service_locator.dart';
import 'package:movies_books/core/widgets/movies_list.dart';
import 'package:movies_books/core/widgets/title_section.dart';
import 'package:movies_books/presentation/movie/bloc/movie_bloc.dart';

class MoviePageContent extends StatelessWidget {
  const MoviePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<MovieBloc>()..add(GetTrendingEvent()),
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(
          children: [
            SearchSection(),
            TitleSection(isLoading: false, title: 'TRENDING'),
            MoviesList(),
            TitleSection(isLoading: false, title: 'LATEST RELEASES'),
            MoviesList(),
            TitleSection(isLoading: false, title: 'TOP RATED'),
            MoviesList(),
            TitleSection(isLoading: false, title: 'UPCOMING'),
            MoviesList(),
          ],
        ))));
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Texts.text1(string: 'Find a Movie'),
            const Padding(
                padding: EdgeInsets.only(top: 25),
                child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.none),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 18),
                        filled: true,
                        fillColor: AppColor.alto,
                        hintText: 'Find a movie',
                        hintStyle:
                            TextStyle(color: AppColor.waterloo, fontSize: 14),
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: AppColor.cello,
                        )))),
          ],
        ));
  }
}
