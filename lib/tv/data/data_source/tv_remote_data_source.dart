
import 'package:dio/dio.dart';
import 'package:movie_app/core/exceptions/error_message_model.dart';
import 'package:movie_app/core/exceptions/server_exception.dart';
import 'package:movie_app/core/network/api_constants.dart';

import 'package:movie_app/tv/data/model/tv_detail_model.dart';
import 'package:movie_app/tv/data/model/tv_model.dart';
import 'package:movie_app/tv/domain/use_case/tv_detail_usecase.dart';

abstract class BaseTvRemoteDataSource{
Future<List<TvModel>>getOnAirTv();
Future<List<TvModel>>getTvPopular();
Future<List<TvModel>>getTvTopRated();
Future<TvDetailModel>getTvDetail(TvDetailParameter parameter);

}

class TvRemoteDataSource extends BaseTvRemoteDataSource {
  @override
  Future<List<TvModel>> getOnAirTv()async {
    final response =  await Dio().get(ApiConstants.onAirTvPath);
    if(response.statusCode == 200){
      return List<TvModel>.from((response.data['results']as List).map((e) => TvModel.fromJson(e)));
    }else{
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getTvPopular()async {
    final response =  await Dio().get(ApiConstants.popularTvPath);
    if(response.statusCode == 200){
      return List<TvModel>.from((response.data['results']as List).map((e) => TvModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }

  @override
  Future<List<TvModel>> getTvTopRated() async{
    final response =  await Dio().get(ApiConstants.topRatedTvPath);
    if(response.statusCode == 200){
      return List<TvModel>.from((response.data['results']as List).map((e) => TvModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }

  @override
  Future<TvDetailModel> getTvDetail(TvDetailParameter parameter) async{
     final response =  await Dio().get(ApiConstants.tvDetailsPath(parameter.tvId));

     if(response.statusCode == 200){
       return TvDetailModel.fromJson(response.data);
     }else{
       throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
     }
  }



}