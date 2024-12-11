class AboutWorkshopReview {
  String? name;
  String? avatar;
  String? createdAt;
  int? starRating;
  String? comment;

  AboutWorkshopReview(
      {this.name, this.avatar, this.createdAt, this.starRating, this.comment});

  AboutWorkshopReview.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
    createdAt = json['created_at'];
    starRating = json['star_rating'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['created_at'] = this.createdAt;
    data['star_rating'] = this.starRating;
    data['comment'] = this.comment;
    return data;
  }
}
