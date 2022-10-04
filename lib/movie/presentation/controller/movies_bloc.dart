import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/base_usecase/base_use_case.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie/domain/use_case/get_now_playing.dart';
import 'package:movie_app/movie/presentation/controller/movies_events.dart';
import 'package:movie_app/movie/presentation/controller/movies_state.dart';

import '../../domain/use_case/get_popular_movies.dart';
import '../../domain/use_case/get_top_reated_movies.dart';

class MoviesBloc extends Bloc<MoviesEvent , MoviesState>{
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(this.getNowPlayingUseCase, this.getPopularMoviesUseCase, this.getTopRatedMoviesUseCase) : super(const MoviesState()){

    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit)async{
    final result =
        await getNowPlayingUseCase(const NoParameters());
    result.fold((l) => emit(
        state.copyWith(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: l.message
        )
    ),
            (r) => emit(
            state.copyWith(
                nowPlayingMovies: r,
                nowPlayingState: RequestState.loaded
            )
        ));
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async{
    final result =
    await getPopularMoviesUseCase(const NoParameters());
    result.fold((l) => emit(
        state.copyWith(
            popularState: RequestState.error,
            popularMessage: l.message
        )
    ),
            (r) => emit(
            state.copyWith(
                popularMovies: r,
                popularState:RequestState.loaded
            )
        ));
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesMoviesEvent event, Emitter<MoviesState> emit)async {
    final result =
    await getTopRatedMoviesUseCase(const NoParameters());

    result.fold((l) => emit(
        state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.message
        )
    ),
            (r) => emit(
            state.copyWith(
                topRatedMovies: r,
                topRatedState: RequestState.loaded
            )
        ));
  }
}