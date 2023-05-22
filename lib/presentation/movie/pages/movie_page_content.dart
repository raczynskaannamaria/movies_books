import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_books/core/resources/app_colors.dart';
import 'package:movies_books/core/resources/app_text.dart';
import 'package:movies_books/core/services/service_locator.dart';
import 'package:movies_books/core/widgets/movies_list.dart';
import 'package:movies_books/core/widgets/title_section.dart';
import 'package:movies_books/presentation/movie/bloc/movie_bloc.dart';
import 'package:movies_books/presentation/movie/pages/search_page.dart';

class MoviePageContent extends StatelessWidget {
  const MoviePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<MovieBloc>()..add(GetTrendingEvent()),
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(
          children:const [
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
                  title:
                      Texts.text2(string: "Find a movie", color: AppColor.waterloo),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
