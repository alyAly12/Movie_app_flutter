import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';

import '../../domain/entities/movies.dart';

class MoviesState extends Equatable {
  final List<Movies> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movies> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;
  final List<Movies> popularMovies;
  final RequestState popularState;
  final String popularMessage;

  const MoviesState(
      {this.nowPlayingMovies = const [],
      this.nowPlayingState = RequestState.loading,
      this.nowPlayingMessage = '',
      this.topRatedMovies = const [],
      this.topRatedState = RequestState.loading,
      this.topRatedMessage = '',
      this.popularMovies = const [],
      this.popularState = RequestState.loading,
      this.popularMessage = ''});


  MoviesState copyWith({
     List<Movies>? nowPlayingMovies,
     RequestState? nowPlayingState,
     String? nowPlayingMessage,
     List<Movies>? topRatedMovies,
     RequestState? topRatedState,
     String? topRatedMessage,
     List<Movies>? popularMovies,
     RequestState? popularState,
     String? popularMessage,
}) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage?? this.nowPlayingMessage,
      topRatedMovies: topRatedMovies?? this.topRatedMovies,
      topRatedState: topRatedState?? this.topRatedState,
      topRatedMessage:  topRatedMessage?? this.topRatedMessage,
      popularMovies: popularMovies?? this.popularMovies,
      popularState:  popularState?? this.popularState,
      popularMessage:  popularMessage?? this.popularMessage
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        topRatedState,
        topRatedMessage,
        topRatedMovies,
        popularState,
        popularMovies,
        popularMessage,
      ];
}
