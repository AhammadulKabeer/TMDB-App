import 'dart:convert';

import 'package:apitmtpproject/models/CastModel.dart';
import 'package:apitmtpproject/models/apiModel.dart';
import 'package:apitmtpproject/models/searchmoviemodel.dart';
import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {"api_key": "a6eeaffe08dac8c6062240199146b2cf"}));

  Future<ApiModel?> gettrending() async {
    try {
      Response response = await dio.get("/trending/movie/day");
      if (response.statusCode == 200) {
        var jsresponse = json.encode(response.data);
        return apiModelFromJson(jsresponse);
      }
    } on DioError catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future<ApiModel?> alsolike() async {
    try {
      Response response = await dio.get("/tv/top_rated");
      if (response.statusCode == 200) {
        var jsresponse = json.encode(response.data);
        return apiModelFromJson(jsresponse);
      }
    } on DioError catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future<ApiModel?> popularmovie() async {
    try {
      Response response = await dio.get("/tv/popular");
      if (response.statusCode == 200) {
        var jsresponse = json.encode(response.data);
        return apiModelFromJson(jsresponse);
      }
    } on DioError catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future<ApiModel?> series() async {
    try {
      Response response = await dio.get("/trending/person/day");
      if (response.statusCode == 200) {
        var jsresponse = json.encode(response.data);
        return apiModelFromJson(jsresponse);
      }
    } on DioError catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future<CastModel?> Cast(int id) async {
    try {
      Response response = await dio.get("/movie/$id/credits");
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        return castModelFromJson(jsonString);
      }
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  Future<SearchModels?> getSearchMovies(String query) async {
    try {
      Response response = await dio.get("/search/movie?query=$query");
      print(query);
      print(response.statusCode);
      if (response.statusCode == 200) {
        String jsonString = json.encode(response.data);
        print(jsonString);
        return searchModelsFromJson(jsonString);
      }
      return null;
    } on DioError catch (e) {
      print("Error on get Search : $e");
    }
    return null;
  }
}
