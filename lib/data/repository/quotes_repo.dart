import 'package:dio/dio.dart';

import '../model/quote_model.dart';
import '../netwrok/dio_helper.dart';
import '../netwrok/end_points.dart';

class QuotesRepo {

  Future<QuoteModel> getQuote([String? anime]) async {
    final Response response;
    if (anime == null || anime.isEmpty) {
      response = await DioHelper.getData(url: EndPoints.random);
    } else {
      response = await DioHelper.getData(
          url: EndPoints.randomByAnime, query: {"title": anime});
    }
    return QuoteModel.fromJson(response.data);
  }

  Future<List<QuoteModel>> getQuotesList([String? anime]) async {
    final Response response;
    if (anime == null || anime.isEmpty) {
      response = await DioHelper.getData(url: EndPoints.quotes);
    } else {
      response = await DioHelper.getData(
          url: EndPoints.quotesByAnime, query: {"title": anime});
    }
    return (response.data as List).map((element) {
      return QuoteModel.fromJson(element);
    }).toList();
  }
}