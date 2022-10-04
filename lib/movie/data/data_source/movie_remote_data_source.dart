import 'package:dio/dio.dart';
import 'package:movie_app/core/network/api_constants.dart';
import 'package:movie_app/core/exceptions/error_message_model.dart';
import 'package:movie_app/movie/data/model/movie_detail_model.dart';
import 'package:movie_app/movie/data/model/movies_model.dart';
import 'package:movie_app/movie/data/model/recommendation_model.dart';
import 'package:movie_app/movie/domain/use_case/get_movie_detail_usecase.dart';
import 'package:movie_app/movie/domain/use_case/get_recommendation_use_case.dart';

import '../../../core/exceptions/server_exception.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>>getNowPlayingMovies();
  Future<List<MovieModel>>getPopularMovies();
  Future<List<MovieModel>>getTopRatedMovies();
  Future<MovieDetailModel>getMovieDetails(MovieDetailParameter parameter);
  Future<List<RecommendationModel>>getRecommendation(RecommendationParameter parameter);
}


class MovieRemoteDataSource extends BaseMovieRemoteDataSource{

  @override
  Future<List<MovieModel>> getNowPlayingMovies()async{
   final response=  await Dio().get(ApiConstants.nowPlayingMoviePath);

    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies()async{
   final response= await Dio().get(ApiConstants.popularMoviePath);
    
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }
    throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies()async {
    final response= await Dio().get(ApiConstants.topRatedMoviePath);
    
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    }
    throw ServerException(
        errorMessageModel:ErrorMessageModel.fromJson(response.data) );
  }

  @override
  Future<MovieDetailModel> getMovieDetails(MovieDetailParameter parameter)async {
   final response =  await Dio().get(ApiConstants.movieDetailsPath(parameter.movieId));
   
   if(response.statusCode == 200){
     return MovieDetailModel.fromJson(response.data);
   }
   else{
     throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
   }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameter parameter) async{
    final response =  await Dio().get(ApiConstants.movieRecommendationPath(parameter.id));
    if(response.statusCode == 200){
      return List<RecommendationModel>.from((response.data['results']as List).map((e) => RecommendationModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }


}