import 'dart:convert';

import 'package:http/http.dart';

import 'package:app/module/rating/rating_model.dart';

class RatingNetwork {
  final String yourViewsURL = "https://service.yourviews.com.br/api/v2/pub/";
  final String storeKey = '4c93a458-0ff1-453e-b5b6-b361ad6aaeda';

  Future<RatingModel> getProductRating(String productId) async {
    Response res = await get(yourViewsURL + 'review/$productId', headers: {"YVStoreKey": storeKey});

    if (res.statusCode == 200) {
      RatingModel ratingModel = RatingModel.fromJson(jsonDecode(res.body));

      return ratingModel;
    } else {
      throw "Error";
    }
  }
}
