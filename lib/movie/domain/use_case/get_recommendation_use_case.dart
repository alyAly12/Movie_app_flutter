import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/exceptions/failure.dart';
import 'package:movie_app/movie/domain/entities/recommendation.dart';
import 'package:movie_app/movie/domain/repository/base_movie_repository.dart';

import '../../../core/base_usecase/base_use_case.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation> ,RecommendationParameter >{

  final BaseMovieRepo baseMovieRepo;

  GetRecommendationUseCase(this.baseMovieRepo);
  @override
  Future<Either<Failure,List< Recommendation>>> call(RecommendationParameter parameters)async {
   return await baseMovieRepo.getRecommendation(parameters);
  }
}








class RecommendationParameter extends Equatable{
  final int id;

 const RecommendationParameter(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}