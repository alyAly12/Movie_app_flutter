import 'package:dartz/dartz.dart';
import 'package:movie_app/tv/domain/entities/tv_details.dart';
import 'package:movie_app/tv/domain/use_case/tv_detail_usecase.dart';

import '../../../core/exceptions/failure.dart';

abstract class BaseTvDetailRepo{
  Future<Either<Failure , TvDetails>> getTvDetails(TvDetailParameter parameters);
}