import 'package:dartz/dartz.dart';
import 'package:movie_app/core/exceptions/failure.dart';
import 'package:movie_app/tv/domain/entities/tv.dart';
import 'package:movie_app/tv/domain/repository/base_tv_repo.dart';

class GetTvPopularUseCase{
  final BaseTvRepo baseTvRepo;

  GetTvPopularUseCase(this.baseTvRepo);

  Future<Either<Failure, List<TV>>> excute()async{
    return await baseTvRepo.getTvPopular();
  }
}