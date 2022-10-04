

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';

import '../../domain/entities/tv.dart';
import '../../domain/use_case/get_ tv_top_rated_usecase.dart';
import '../../domain/use_case/get_tv_popular_usecase.dart';
import '../../domain/use_case/on_air_usecase.dart';

part 'tv_event.dart';
part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetOnAirUseCase onAirUseCase;
  final GetTvTopRatedUseCase tvTopRatedUseCase;
  final GetTvPopularUseCase getTvPopularUseCase;
  TvBloc(this.onAirUseCase, this.tvTopRatedUseCase, this.getTvPopularUseCase, ) : super(const TvState()) {


    on<GetOnAirTvEvent>(_getOnAirTv);
    on<GetPopularTvEvent>(_getPopularTv);
    on<GetTopRatedTvEvent>(_getTopRatedTv);
  }



  FutureOr<void> _getOnAirTv(GetOnAirTvEvent event, Emitter<TvState> emit)async {
    final result = await onAirUseCase.excute();
    result.fold((l) => emit(
      state.copyWith(
        onAirMessage: l.message,
        onAirState: RequestState.error
      )
    ),
            (r) => emit(
              state.copyWith(
                onAirTv: r,
                onAirState: RequestState.loaded
              )
            ),
    );
  }

  FutureOr<void> _getPopularTv(GetPopularTvEvent event, Emitter<TvState> emit) async{
    final result =  await getTvPopularUseCase.excute();
     result.fold((l) => emit(
       state.copyWith(
         popularTvMessage: l.message,
         popularTvState: RequestState.error
       )
     ),
             (r) => emit(
               state.copyWith(
                 popularTv: r,
                 popularTvState: RequestState.loaded
               )
             ),);
  }

  FutureOr<void> _getTopRatedTv(GetTopRatedTvEvent event, Emitter<TvState> emit)async {

    final result =  await tvTopRatedUseCase.excute();
    result.fold((l) => emit(
      state.copyWith(
        topRatedTvMessage: l.message,
        topRatedTvState: RequestState.error
      )
    ),
            (r) => emit(
              state.copyWith(
                topRatedTv: r,
                topRatedTvState: RequestState.loaded
              )
            ));
  }
}
