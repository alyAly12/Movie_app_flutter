import 'package:dartz/dartz.dart';
import 'package:movie_app/movie/domain/entities/movie_details.dart';
import 'package:movie_app/movie/domain/entities/movies.dart';
import 'package:movie_app/movie/domain/entities/recommendation.dart';
import 'package:movie_app/movie/domain/use_case/get_movie_detail_usecase.dart';
import 'package:movie_app/movie/domain/use_case/get_recommendation_use_case.dart';

import '../../../core/exceptions/failure.dart';

abstract class BaseMovieRepo{
  Future<Either<Failure,List<Movies>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movies>>> getPopularMovies();
  Future<Either<Failure,List<Movies>>> getTopRatedMovies();
  Future<Either<Failure , MovieDetail>> getMovieDetail(MovieDetailParameter parameter);
  Future<Either<Failure , List<Recommendation>>>getRecommendation(RecommendationParameter parameter);
}