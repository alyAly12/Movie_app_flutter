import 'package:movie_app/tv/domain/entities/tv_details.dart';

class TvDetailModel extends TvDetails {
  const TvDetailModel(
      {required super.title,
      required super.web,
      required super.key,
      required super.size,
      required super.id});


  factory TvDetailModel.fromJson(Map<String ,dynamic>json)=>
      TvDetailModel(
          title: json['name'],
          web: json['site'],
          key: json['key'],
          size: json['size'],
          id: json['id']
      );
}
