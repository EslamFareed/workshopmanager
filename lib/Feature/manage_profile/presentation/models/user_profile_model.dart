class UserProfileModel {
  int? id;
  String? avatar;
  String? name;
  String? email;
  String? phone;
  Profile? profile;

  UserProfileModel(
      {this.id, this.avatar, this.name, this.email, this.phone, this.profile});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  String? companyName;
  String? website;
  String? taxCard;
  String? companyRegisteration;

  Profile(
      {this.companyName,
      this.website,
      this.taxCard,
      this.companyRegisteration});

  Profile.fromJson(Map<String, dynamic> json) {
    companyName = json['company_name'];
    website = json['website'];
    taxCard = json['tax_card'];
    companyRegisteration = json['company_registeration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_name'] = this.companyName;
    data['website'] = this.website;
    data['tax_card'] = this.taxCard;
    data['company_registeration'] = this.companyRegisteration;
    return data;
  }
}
