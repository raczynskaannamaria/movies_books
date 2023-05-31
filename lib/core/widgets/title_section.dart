import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_books/core/resources/app_colors.dart';
import 'package:movies_books/core/resources/app_text.dart';
import 'package:movies_books/core/widgets/image_container.dart';
import 'package:movies_books/presentation/movie/bloc/movie_bloc.dart';
import 'package:movies_books/presentation/movie/pages/details_page.dart';
import 'package:movies_books/presentation/movie/pages/see_all.dart';
import 'package:shimmer/shimmer.dart';

class TitleSection extends StatelessWidget {
  final int type;
  final String title;
  const TitleSection({
    super.key,
    required this.type,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        switch (type) {
          case 1:
            return Column(
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.arimo(
                            textStyle:
                                TextStyle(color: AppColor.cello, fontSize: 25)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeeAllMovies(
                                      title: title,
                                      movieList: state.trendingMovies)));
                        },
                        child: Text(
                          "See all",
                          style: GoogleFonts.arimo(
                              textStyle: TextStyle(
                                  color: AppColor.cello, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 210.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                      padding: const EdgeInsets.only(left: 16.0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                        movieId:
                                            state.trendingMovies[index].id),
                                  ));
                            },
                            child: ImageContainer(
                                image_URL:
                                    state.trendingMovies[index].posterPath,
                                rate: state.trendingMovies[index].voteAverage),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 8.0,
                          ),
                      itemCount: state.trendingMovies.length),
                ),
              ],
            );
          case 2:
            return Column(
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(title,
                          style: GoogleFonts.arimo(
                              textStyle: TextStyle(
                                  color: AppColor.cello, fontSize: 25))),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeeAllMovies(
                                      title: title,
                                      movieList: state.latestMovies)));
                        },
                        child: Text(
                          "See all",
                          style: GoogleFonts.arimo(
                              textStyle: TextStyle(
                                  color: AppColor.cello, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 210.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                      padding: const EdgeInsets.only(left: 16.0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                        movieId: state.latestMovies[index].id),
                                  ));
                            },
                            child: ImageContainer(
                                image_URL: state.latestMovies[index].posterPath,
                                rate: state.latestMovies[index].voteAverage),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 8.0,
                          ),
                      itemCount: state.latestMovies.length),
                ),
              ],
            );

          case 3:
            return Column(
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.arimo(
                            textStyle:
                                TextStyle(color: AppColor.cello, fontSize: 25)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeeAllMovies(
                                      title: title,
                                      movieList: state.topRatedMovies)));
                        },
                        child: Text(
                          "See all",
                          style: GoogleFonts.arimo(
                              textStyle: TextStyle(
                                  color: AppColor.cello, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 210.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                      padding: const EdgeInsets.only(left: 16.0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                        movieId:
                                            state.topRatedMovies[index].id),
                                  ));
                            },
                            child: ImageContainer(
                                image_URL:
                                    state.topRatedMovies[index].posterPath,
                                rate: state.topRatedMovies[index].voteAverage),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 8.0,
                          ),
                      itemCount: state.topRatedMovies.length),
                ),
              ],
            );

          case 4:
            return Column(
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.arimo(
                            textStyle:
                                TextStyle(color: AppColor.cello, fontSize: 25)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeeAllMovies(
                                      title: title,
                                      movieList: state.upcomingMovies)));
                        },
                        child: Text(
                          "See all",
                          style: GoogleFonts.arimo(
                              textStyle: TextStyle(
                                  color: AppColor.cello, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 210.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                      padding: const EdgeInsets.only(left: 16.0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                        movieId:
                                            state.upcomingMovies[index].id),
                                  ));
                            },
                            child: ImageContainer(
                                image_URL:
                                    state.upcomingMovies[index].posterPath,
                                rate: state.upcomingMovies[index].voteAverage),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 8.0,
                          ),
                      itemCount: state.upcomingMovies.length),
                ),
              ],
            );
        }
        return Container();
      },
    );
  }
}








/*class TitleSection extends StatelessWidget {
  const TitleSection(
      {super.key,
      required this.title,
      required this.isLoading,
      required this.seeAllList});

  final String title;
  final bool isLoading;
  final List seeAllList;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTitle(context),
            _buildSeeAll(context),
          ],
        ));
  }

  Widget _buildTitle(BuildContext context) {
    if (isLoading) {
      return Shimmer.fromColors(
          baseColor: AppColor.cello,
          highlightColor: AppColor.seaNymph,
          child: Texts.text2(string: title));
    } else {
      return Texts.text2(string: title);
    }
  }

  Widget _buildSeeAll(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SeeAllMovies(
                      title: title,
                      movieList: [],
                    )));
      },
      child: const Text(
        'See all',
        style: TextStyle(color: AppColor.cello),
      ),
    );
  }
}*/
