part of 'tv_bloc.dart';


 class TvState extends Equatable {

  final List<TV>onAirTv;
  final RequestState onAirState;
  final String onAirMessage;
  final List<TV>topRatedTv;
  final RequestState topRatedTvState;
  final String topRatedTvMessage;
  final List<TV>popularTv;
  final RequestState popularTvState;
  final String popularTvMessage;

  const TvState({
    this.onAirTv = const[],
    this.onAirState = RequestState.loading,
    this.onAirMessage = '',
    this.topRatedTv = const[],
    this.topRatedTvState = RequestState.loading,
    this.topRatedTvMessage = '',
    this.popularTv = const [],
    this.popularTvState = RequestState.loading,
    this.popularTvMessage = ''
  });

  TvState copyWith({
    List<TV>?onAirTv ,
     RequestState? onAirState,
     String? onAirMessage,
    List<TV>?topRatedTv,
    RequestState? topRatedTvState,
     String? topRatedTvMessage,
    List<TV>?popularTv,
     RequestState? popularTvState,
     String? popularTvMessage,
  }) {
    return TvState(
        onAirTv: onAirTv ?? this.onAirTv,
        onAirState: onAirState ?? this.onAirState,
        onAirMessage: onAirMessage ?? this.onAirMessage,
        topRatedTv: topRatedTv ?? this.topRatedTv,
        topRatedTvState: topRatedTvState ?? this.topRatedTvState,
        topRatedTvMessage: topRatedTvMessage ?? this.topRatedTvMessage,
        popularTv: popularTv ?? this.popularTv,
        popularTvState: popularTvState ?? this.popularTvState,
        popularTvMessage: popularTvMessage ?? this.popularTvMessage
    );
  }

  @override
  List<Object> get props =>
      [
        onAirTv,
        onAirState,
        onAirMessage,
        topRatedTv,
        topRatedTvState,
        topRatedTvMessage,
        popularTv,
        popularTvState,
        popularTvMessage,
      ];
}


