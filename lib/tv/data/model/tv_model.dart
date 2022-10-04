import 'package:movie_app/tv/domain/entities/tv.dart';

class TvModel extends TV{
  const TvModel({
    required super.id,
    required super.title,
    required super.overView,
    required super.backDropPath,
    required super.voteAverage,
    required super.genreIds
  });

  factory TvModel.fromJson(Map<String ,dynamic>json)=>
      TvModel(
          id: json['id'],
          title: json['name'],
          overView: json['overview'],
          backDropPath: json['backdrop_path'],
          voteAverage: json['vote_average'].toDouble(),
          genreIds: List<int>.from(json['genre_ids'].map((e)=>e))
      );
}