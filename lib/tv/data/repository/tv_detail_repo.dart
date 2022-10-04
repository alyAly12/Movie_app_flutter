import 'package:dartz/dartz.dart';
import 'package:movie_app/core/exceptions/failure.dart';
import 'package:movie_app/tv/domain/entities/tv_details.dart';
import 'package:movie_app/tv/domain/repository/base_tv_detail_repo.dart';
import 'package:movie_app/tv/domain/use_case/tv_detail_usecase.dart';

class TvDetailRepo extends BaseTvDetailRepo{
  @override
  Future<Either<Failure, TvDetails>> getTvDetails(TvDetailParameter parameters) {
    // TODO: implement getTvDetails
    throw UnimplementedError();
  }
}