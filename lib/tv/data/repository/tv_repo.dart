import 'package:dartz/dartz.dart';
import 'package:movie_app/core/exceptions/failure.dart';
import 'package:movie_app/core/exceptions/server_exception.dart';
import 'package:movie_app/tv/data/data_source/tv_remote_data_source.dart';
import 'package:movie_app/tv/domain/entities/tv.dart';
import 'package:movie_app/tv/domain/repository/base_tv_repo.dart';

class TvRepo extends BaseTvRepo{
  TvRemoteDataSource tvRemoteDataSource;

  TvRepo(this.tvRemoteDataSource);

  @override
  Future<Either<Failure, List<TV>>> getOnAir()async {
    final result =  await tvRemoteDataSource.getOnAirTv();

    try{
     return right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getTvPopular()async {
    final result =  await tvRemoteDataSource.getTvPopular();
    try{
      return right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure, List<TV>>> getTvTopRated()async {
    final result = await tvRemoteDataSource.getTvTopRated();
    try{
      return right(result);
    }on ServerException catch(failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}