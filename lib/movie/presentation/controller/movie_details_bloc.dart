import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie/domain/entities/movie_details.dart';
import 'package:movie_app/movie/domain/use_case/get_movie_detail_usecase.dart';
import 'package:movie_app/movie/domain/use_case/get_recommendation_use_case.dart';

import '../../domain/entities/recommendation.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.movieDetailUseCase, this.recommendationUseCase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  final GetMovieDetailUseCase movieDetailUseCase;
  final GetRecommendationUseCase recommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await movieDetailUseCase(MovieDetailParameter(movieId: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
            movieDetailState: RequestState.error, message: l.message
        ),
      ),
      (r) => emit(
        state.copyWith(movieDetail: r, movieDetailState: RequestState.loaded),
      ),
    );
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit)async {
    final result =
    await recommendationUseCase(RecommendationParameter(event.id));
    result.fold(
          (l) => emit(
        state.copyWith(
            recommendationState: RequestState.error, recommendationMessage: l.message),
      ),
          (r) => emit(
        state.copyWith(recommendation: r, recommendationState: RequestState.loaded),
      ),
    );
  }
}
