class RatingModel {
  bool hasErrors;
  Element element;
  int total;
  int currentPage;

  RatingModel({this.hasErrors, this.element, this.total, this.currentPage});

  RatingModel.fromJson(Map<String, dynamic> json) {
    hasErrors = json['HasErrors'] ?? false;
    element = json['Element'] != null ? new Element.fromJson(json['Element']) : null;

    total = json['Total'] ?? 0;
    currentPage = json['CurrentPage'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HasErrors'] = this.hasErrors;
    if (this.element != null) {
      data['Element'] = this.element.toJson();
    }
    data['Total'] = this.total;
    data['CurrentPage'] = this.currentPage;
    return data;
  }
}

class Element {
  double rating;
  int totalRatings;

  Element({
    this.rating,
    this.totalRatings,
  });

  Element.fromJson(Map<String, dynamic> json) {
    rating = json['Rating'] ?? 0;
    totalRatings = json['TotalRatings'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['Rating'] = this.rating;
    data['TotalRatings'] = this.totalRatings;

    return data;
  }
}
