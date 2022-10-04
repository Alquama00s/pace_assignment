import 'dart:developer';

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get/get.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/http_service.dart';

class NewsController extends GetxController {
  final _newsList = Rx<List<Article>>([]);
  final _loading = false.obs;

  List<Article> get articles => _newsList.value;
  bool get isLoading => _loading.value;

  void updateNews() async {
    _loading(true);
    try {
      final response = await HttpService.http.get('/top-headlines',
          options: HttpService.cacheOption
              .copyWith(policy: CachePolicy.refresh)
              .toOptions(),
          queryParameters: {"country": "in"});
      if (response.data is Map && response.data["articles"] is List) {
        List<Article> list = [];

        (response.data["articles"] as List).forEach((element) {
          try {
            list.add(Article.fromJson(element));
          } catch (e) {
            log("invalid article filtered");
          }
        });

        _newsList(list);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    } finally {
      _loading(false);
    }
  }
}
