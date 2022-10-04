import 'package:movie_app/movie/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation{
const   RecommendationModel({ super.backDropPath, required super.id});


  factory RecommendationModel.fromJson(Map<String , dynamic>json)=>RecommendationModel(
      backDropPath: json['backdrop_path'] ??"/a9jgZnmKVbhxiiC2Rl01X7BNK1k.jpg",
      id: json['id']
  );

}