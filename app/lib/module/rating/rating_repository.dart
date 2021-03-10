import 'package:app/module/rating/rating_model.dart';
import 'package:app/module/rating/rating_network.dart';

class RatingRepository {
  final RatingNetwork ratingNetwork;

  RatingRepository(this.ratingNetwork);

  Future<RatingModel> getProductRating(String productId) async {
    return await ratingNetwork.getProductRating(productId);
  }
}
