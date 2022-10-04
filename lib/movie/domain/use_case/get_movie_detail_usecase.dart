import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/base_usecase/base_use_case.dart';
import 'package:movie_app/core/exceptions/failure.dart';
import 'package:movie_app/movie/domain/entities/movie_details.dart';
import 'package:movie_app/movie/domain/repository/base_movie_repository.dart';

class GetMovieDetailUseCase extends BaseUseCase<MovieDetail ,MovieDetailParameter>{
  final BaseMovieRepo baseMovieRepo;

  GetMovieDetailUseCase(this.baseMovieRepo);
  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailParameter parameters)async {

    return await baseMovieRepo.getMovieDetail(parameters);
  }
}

class MovieDetailParameter extends Equatable{

  final int movieId;

 const MovieDetailParameter({required this.movieId});

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}