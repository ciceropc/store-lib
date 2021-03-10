import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/util/constants.dart';

class ReviewRepository {
  Future sendReview(bool thunbsUp, String comment) async {
    var data = {"thumbs_up": thunbsUp, "comment": comment};
    return await FirebaseFirestore.instance.collection(REVIEW_COLLECTION).doc().set(data);
  }
}
