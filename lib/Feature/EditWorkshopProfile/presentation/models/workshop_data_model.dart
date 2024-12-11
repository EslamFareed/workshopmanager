class WorkshopProfileModel {
  String? logo;
  int? id;
  String? name;
  String? address;
  String? geoLat;
  String? geoLng;
  String? phone1;
  String? arDescription;
  String? enDescription;
  List<String>? images;
  Government? government;
  Government? center;
  List<WorkingHours>? workingHours;

  WorkshopProfileModel(
      {this.logo,
      this.id,
      this.name,
      this.address,
      this.geoLat,
      this.geoLng,
      this.phone1,
      this.arDescription,
      this.enDescription,
      this.images,
      this.workingHours,
      this.government,
      this.center});

  WorkshopProfileModel.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    id = json['id'];
    name = json['name'];
    address = json['address'];
    geoLat = json['geo_lat'];
    geoLng = json['geo_lng'];
    phone1 = json['phone_1'];
    arDescription = json['ar_description'];
    enDescription = json['en_description'];
    images = json['images'].cast<String>();
    government = json['government'] != null
        ? new Government.fromJson(json['government'])
        : null;
    center =
        json['center'] != null ? new Government.fromJson(json['center']) : null;

    if (json['working_hours'] != null) {
      workingHours = <WorkingHours>[];
      json['working_hours'].forEach((v) {
        workingHours!.add(new WorkingHours.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo'] = this.logo;
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['geo_lat'] = this.geoLat;
    data['geo_lng'] = this.geoLng;
    data['phone_1'] = this.phone1;
    data['ar_description'] = this.arDescription;
    data['en_description'] = this.enDescription;
    data['images'] = this.images;
    if (this.government != null) {
      data['government'] = this.government!.toJson();
    }
    if (this.center != null) {
      data['center'] = this.center!.toJson();
    }
    if (this.workingHours != null) {
      data['working_hours'] =
          this.workingHours!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Government {
  int? id;
  String? arName;
  String? enName;

  Government({this.id, this.arName, this.enName});

  Government.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arName = json['ar_name'];
    enName = json['en_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ar_name'] = this.arName;
    data['en_name'] = this.enName;
    return data;
  }
}

class WorkingHours {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? workShopId;
  String? day;
  String? startHour;
  String? endHour;
  int? isOff;

  WorkingHours(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.workShopId,
      this.day,
      this.startHour,
      this.endHour,
      this.isOff});

  WorkingHours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    workShopId = json['work_shop_id'];
    day = json['day'];
    startHour = json['start_hour'];
    endHour = json['end_hour'];
    isOff = json['is_off'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['work_shop_id'] = this.workShopId;
    data['day'] = this.day;
    data['start_hour'] = this.startHour;
    data['end_hour'] = this.endHour;
    data['is_off'] = this.isOff;
    return data;
  }
}
