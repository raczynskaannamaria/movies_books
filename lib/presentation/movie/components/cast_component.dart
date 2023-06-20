import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_books/core/services/service_locator.dart';
import 'package:movies_books/core/util/api_constants.dart';
import 'package:movies_books/core/util/enums.dart';
import 'package:movies_books/domain/entities/cast_entity.dart';
import 'package:movies_books/domain/usecases/get_cast_usecase.dart';
import 'package:movies_books/presentation/movie/bloc/cast/cast_bloc.dart';

class CastComponent extends StatelessWidget {
  final int movieId;
  const CastComponent({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CastEntity>? cast;
    return BlocProvider(
        create: (context) =>
            getIt<CastBloc>()..add(GetCastEvent(movieId: movieId)),
        child: BlocBuilder<CastBloc, CastState>(builder: (context, state) {
          cast = state.castEntity;
          switch (state.state) {
            case RequestState.loading:
              return const SizedBox(
                  height: 170,
                  child: Center(child: CircularProgressIndicator()));
            case RequestState.loaded:
              print('cast');
              return SizedBox(
                height: 200,
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 2.4,
                  ),
                  itemCount: cast!.length,
                  itemBuilder: (context, index) => _cast(cast![index], context),
                ),
              );
            /* Container(
                  height: 100,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.castEntity!.length,
                      itemBuilder: (context, index) {
                        final castEntity = state.castEntity![index];
                        return Container(
                          height: 100,
                          width: 160,
                          child: Card(
                            elevation: 1,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                    child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(8),
                                  ),
                                  child: CachedNetworkImage(
                                    height: 100,
                                    width: 120,
                                    imageUrl: ApiConstants.image_URL(
                                        cast![index].profilePath),
                                    fit: BoxFit.fitWidth,
                                  ),
                                )),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      castEntity.name,
                                      overflow: TextOverflow.fade,
                                      maxLines: 1,
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                      bottom: 2,
                                    ),
                                    child: Text(
                                      castEntity.character,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ))
                              ],
                            ),
                          ),
                        );
                      })); */

            case RequestState.error:
              return Container(child: Center(child: Icon(Icons.error)));
            default:
              return Container();
          }
        }));
  }
}

@override
Container _cast(CastEntity cast, context) {
  return Container(
      margin: EdgeInsets.only(right: 8),
      height: 100,
      child: Row(
        children: [
          CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                ApiConstants.image_URL(cast.profilePath),
              )),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('character'
                    /* cast.character,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(overflow: TextOverflow.ellipsis), */
                    ),
                Text(
                  cast.name,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ));
}



  /*return Container(
        padding: EdgeInsets.all(9.0),
        child: SizedBox(
            height: 200,
            child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, childAspectRatio: 1 / 2.2),
                itemCount: 3,
                itemBuilder: (context, index) => _cast())));
  }



    margin: EdgeInsets.all(8),
    child: Row(children: [
      CircleAvatar(radius: 20),
      SizedBox(width: 20),
      Flexible(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Actor name'), Text('Character')],
          ),
        ),
      )
    ]),
  );
}
*/