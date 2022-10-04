import 'package:dartz/dartz.dart';
import 'package:movie_app/core/exceptions/failure.dart';
import 'package:movie_app/core/exceptions/server_exception.dart';
import 'package:movie_app/movie/domain/entities/movie_details.dart';

import 'package:movie_app/movie/domain/entities/movies.dart';
import 'package:movie_app/movie/domain/entities/recommendation.dart';
import 'package:movie_app/movie/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movie/domain/use_case/get_movie_detail_usecase.dart';
import 'package:movie_app/movie/domain/use_case/get_recommendation_use_case.dart';

import '../data_source/movie_remote_data_source.dart';

class MoviesRepository extends BaseMovieRepo{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Failure,List<Movies>>> getNowPlayingMovies()async {
   final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
   try{
     return right(result);
   }on ServerException catch(failure){
     return left(ServerFailure(failure.errorMessageModel.statusMessage));
   }

  }

  @override
  Future<Either<Failure,List<Movies>>>  getPopularMovies()async{
     final result= await baseMovieRemoteDataSource.getPopularMovies();
     try{
       return right(result);
     }on ServerException catch(failure){
       return left(ServerFailure(failure.errorMessageModel.statusMessage));
     }

  }

  @override
  Future<Either<Failure,List<Movies>>>  getTopRatedMovies()async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(MovieDetailParameter parameter)async {
   final result =  await baseMovieRemoteDataSource.getMovieDetails(parameter);
   try{
     return right(result);
   }on ServerException catch(failure){
     return left(ServerFailure(failure.errorMessageModel.statusMessage));
   }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameter parameter)async {
    final result =  await baseMovieRemoteDataSource.getRecommendation(parameter);
    try{
      return right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}