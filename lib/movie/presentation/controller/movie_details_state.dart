part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {


  final MovieDetail?  movieDetail;
  final String movieDetailsMessage;
  final RequestState movieDetailState;
  final List<Recommendation>recommendation;
  final String recommendationMessage;
  final RequestState recommendationState;

const  MovieDetailsState({
    this.movieDetail,
    this.movieDetailsMessage ='',
    this.movieDetailState = RequestState.loading,
   this.recommendation = const[],
  this.recommendationState=RequestState.loading,
  this.recommendationMessage = ''
  });
 MovieDetailsState copyWith({
    MovieDetail?  movieDetail,
    String? message,
    RequestState? movieDetailState,
    List<Recommendation>?recommendation,
    String ?recommendationMessage,
    RequestState ?recommendationState,
}){
   return  MovieDetailsState(
     movieDetail: movieDetail?? this.movieDetail,
     movieDetailsMessage: movieDetailsMessage,
     movieDetailState: movieDetailState?? this.movieDetailState,
     recommendation: recommendation?? this.recommendation,
     recommendationMessage: recommendationMessage?? this.recommendationMessage,
     recommendationState: recommendationState?? this.recommendationState
   );
}
  @override
  // TODO: implement props
  List<Object?> get props => [movieDetail , movieDetailState , movieDetailsMessage,recommendation,recommendationState,recommendationMessage];

}



