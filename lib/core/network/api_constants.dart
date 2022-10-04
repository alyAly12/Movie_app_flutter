class ApiConstants{

  /// movies
  static const String baseUrl='https://api.themoviedb.org/3';
  static const String apiKey='f8d767965d5422d9757a67d5608e75ab';
  static const String nowPlayingMoviePath='$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviePath ='$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviePath='$baseUrl/movie/top_rated?api_key=$apiKey';
  static  String movieDetailsPath(int movieId)=>'$baseUrl/movie/$movieId?api_key=$apiKey';
  static  String movieRecommendationPath(int movieId)=>'$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';

  /// tv
  static const String onAirTvPath='$baseUrl/tv/on_the_air?api_key=$apiKey';
  static const String popularTvPath='$baseUrl/tv/popular?api_key=$apiKey';
  static const String topRatedTvPath='$baseUrl/tv/top_rated?api_key=$apiKey';
///tv detail
  static  String tvDetailsPath(int tvId)=>'$baseUrl/tv/$tvId/videos?api_key=$apiKey';

  static const String baseImageUrl ='https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path)=> '$baseImageUrl$path';
}