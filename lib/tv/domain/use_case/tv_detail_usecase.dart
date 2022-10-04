import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/base_usecase/base_use_case.dart';
import 'package:movie_app/core/exceptions/failure.dart';

import 'package:movie_app/tv/domain/entities/tv_details.dart';
import 'package:movie_app/tv/domain/repository/base_tv_detail_repo.dart';

class TvDetailUseCase extends BaseUseCase<TvDetails ,TvDetailParameter> {
  final BaseTvDetailRepo baseTvDetailRepo;

  TvDetailUseCase(this.baseTvDetailRepo);

  @override
  Future<Either<Failure,TvDetails>> call(TvDetailParameter parameters)async {
    return await baseTvDetailRepo.getTvDetails(parameters);
  }
}
class TvDetailParameter extends Equatable{
  final int tvId;

  const TvDetailParameter(this.tvId);

  @override
  // TODO: implement props
  List<Object?> get props =>[tvId];
}