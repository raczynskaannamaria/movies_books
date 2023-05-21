import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_books/core/widgets/movies_list.dart';
import 'package:movies_books/core/widgets/title_section.dart';

class MoviePageContent extends StatelessWidget {
  const MoviePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
              TitleSection(title: 'TRENDING'),
              MoviesList(),
              TitleSection(title: 'LATEST RELEASES'),
              MoviesList(),
              TitleSection(title: 'TOP RATED'),
              MoviesList(),
              TitleSection(title: 'UPCOMING'),
              MoviesList(),
            ])));
  }
}
