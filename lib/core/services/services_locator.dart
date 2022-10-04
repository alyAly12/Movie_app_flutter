
import 'package:get_it/get_it.dart';
import 'package:movie_app/movie/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movie/data/repository/movies_repository.dart';
import 'package:movie_app/movie/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movie/domain/use_case/get_movie_detail_usecase.dart';
import 'package:movie_app/movie/domain/use_case/get_now_playing.dart';
import 'package:movie_app/movie/domain/use_case/get_popular_movies.dart';
import 'package:movie_app/movie/domain/use_case/get_recommendation_use_case.dart';
import 'package:movie_app/movie/domain/use_case/get_top_reated_movies.dart';
import 'package:movie_app/movie/presentation/controller/movie_details_bloc.dart';
import 'package:movie_app/movie/presentation/controller/movies_bloc.dart';
import 'package:movie_app/tv/data/data_source/tv_remote_data_source.dart';

import 'package:movie_app/tv/data/repository/tv_repo.dart';

import 'package:movie_app/tv/domain/repository/base_tv_repo.dart';
import 'package:movie_app/tv/domain/use_case/get_%20tv_top_rated_usecase.dart';
import 'package:movie_app/tv/domain/use_case/get_tv_popular_usecase.dart';
import 'package:movie_app/tv/domain/use_case/on_air_usecase.dart';
import 'package:movie_app/tv/domain/use_case/tv_detail_usecase.dart';
import 'package:movie_app/tv/presentation/controller/tv_bloc.dart';

final GetIt sl = GetIt.instance;
class ServicesLocator{

  void init(){

    /// Tv bloc
    sl.registerFactory(() => TvBloc(sl(), sl(), sl()));
    /// Movie bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(),sl()));
    /// Movie Detail bloc
    sl.registerFactory(() => MovieDetailsBloc(sl() ,sl()));
    /// Use Cases for movies
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    /// Use case for tv
    sl.registerLazySingleton(() => GetOnAirUseCase(sl()));
    sl.registerLazySingleton(() => GetTvPopularUseCase(sl()));
    sl.registerLazySingleton(() => GetTvTopRatedUseCase(sl()));
    sl.registerLazySingleton(() => TvDetailUseCase(sl()));
    /// Repository for movie
    sl.registerLazySingleton<BaseMovieRepo>(() => MoviesRepository(sl()));
    /// Repository for tv
    sl.registerLazySingleton<BaseTvRepo>(() => TvRepo(sl()));






    ///  DAta Source for movie
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    /// Data Source for tv
    sl.registerLazySingleton<BaseTvRemoteDataSource>(() => TvRemoteDataSource());
    sl.registerLazySingleton<TvRemoteDataSource>(() => TvRemoteDataSource());

  }
}