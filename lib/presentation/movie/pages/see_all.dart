import 'package:flutter/material.dart';
import 'package:movies_books/core/widgets/grid_view.dart';
import 'package:movies_books/core/widgets/movie_list_card.dart';
import 'package:movies_books/domain/entities/movie_entity.dart';

class SeeAllMovies extends StatelessWidget {
  final String title;
  final List<MovieEntity> movieList;
  const SeeAllMovies({required this.title, Key? key, required this.movieList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_left_outlined),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch(movieList));
              },
              icon: Icon(Icons.search_outlined))
        ],
      ),
      body: buildMovieGrid(movie: movieList),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<MovieEntity> list;

  CustomSearch(this.list);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close_rounded),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_left, color: Colors.white));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<MovieEntity> matching = [];
    for (var movie in list) {
      if (movie.title.toLowerCase().contains(query.toLowerCase())) {
        matching.add(movie);
      }
    }
    return buildMovieGrid(movie: matching);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<MovieEntity> matching = [];
    for (var movie in list) {
      if (movie.title.toLowerCase().contains(query.toLowerCase())) {
        matching.add(movie);
      }
    }
    return buildMovieGrid(movie: matching);
  }
}
