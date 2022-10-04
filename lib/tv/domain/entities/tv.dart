import 'package:equatable/equatable.dart';

class TV extends Equatable {
  final int id;
  final String title;
  final String overView;
  final String backDropPath;
  final double voteAverage;
  final List<int> genreIds;

  const TV({
    required this.id,
    required this.title,
    required this.overView,
    required this.backDropPath,
    required this.voteAverage,
    required this.genreIds});


  @override
  List<Object> get props =>
      [id, title, overView, backDropPath, voteAverage, genreIds,];
}