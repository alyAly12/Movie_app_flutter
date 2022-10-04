
import 'package:dartz/dartz.dart';
import 'package:movie_app/tv/domain/entities/tv.dart';

import '../../../core/exceptions/failure.dart';

abstract class BaseTvRepo{
Future<Either<Failure , List<TV>>> getOnAir();
Future<Either<Failure , List<TV>>> getTvPopular();
Future<Either<Failure ,List<TV>>> getTvTopRated();
}