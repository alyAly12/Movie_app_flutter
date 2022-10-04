import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base_usecase/base_use_case.dart';
import 'package:movie_app/movie/domain/entities/movies.dart';
import 'package:movie_app/movie/domain/repository/base_movie_repository.dart';

import '../../../core/exceptions/failure.dart';

class GetNowPlayingUseCase extends BaseUseCase<List<Movies>,NoParameters>{
  final BaseMovieRepo baseMovieRepo;
  GetNowPlayingUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async{
    return await baseMovieRepo.getNowPlayingMovies();
  }


}