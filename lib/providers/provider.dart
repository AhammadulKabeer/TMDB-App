import 'package:apitmtpproject/apiservice/apiService.dart';
import 'package:apitmtpproject/models/CastModel.dart';
import 'package:apitmtpproject/models/apiModel.dart';
import 'package:apitmtpproject/models/searchmoviemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomprovider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
final pageProvider = StateProvider.autoDispose<PageController>((ref) {
  return PageController();
});
final Apiprovider = Provider.autoDispose<ApiService>((ref) {
  return ApiService();
});
final trendingProvider = FutureProvider.autoDispose<ApiModel?>((ref) async {
  return await ref.watch(Apiprovider).gettrending();
});
final homeFutureProvider = FutureProvider.autoDispose<List<ApiModel?>>((
  ref,
) async {
  List<ApiModel?> futureData = await Future.wait([
    ref.watch(Apiprovider).gettrending(),
    ref.watch(Apiprovider).alsolike(),
    ref.watch(Apiprovider).popularmovie(),
    ref.watch(Apiprovider).series(),
  ]);
  return futureData;
});

final castprovider =
    FutureProvider.family.autoDispose<CastModel?, int>((ref, s) async {
  return await ref.watch(Apiprovider).Cast(s);
});

//search page
final textProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});
final searchprovider = FutureProvider.autoDispose
    .family<SearchModels?, String>((ref, query) async {
  return await ref.watch(Apiprovider).getSearchMovies(query);
});
