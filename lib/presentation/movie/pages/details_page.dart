import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_books/core/resources/app_colors.dart';
import 'package:movies_books/core/services/service_locator.dart';
import 'package:movies_books/domain/usecases/get_cast_usecase.dart';
import 'package:movies_books/presentation/movie/bloc/details_bloc.dart';
import 'package:movies_books/presentation/movie/components/cast_component.dart';
import 'package:movies_books/presentation/movie/components/details_component.dart';
import 'package:movies_books/presentation/movie/components/text_details_component.dart';

class DetailsPage extends StatelessWidget {
  final int movieId;

  const DetailsPage({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            getIt<DetailsBloc>()..add(GetDetailsEvent(movieId: movieId)),
        child: Scaffold(
          appBar: AppBar(backgroundColor: AppColor.waterloo),
          body: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    MovieDetailsComponent(),
                    SizedBox(height: 30),
                    TextDetailsComponent(),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
