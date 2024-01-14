class ModelEditProfile {
  int? status;
  String? message;
  Data? data;

  ModelEditProfile({this.status, this.message, this.data});

  ModelEditProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? memberId;
  String? patientId;
  String? fullname;
  String? phone;
  String? email;
  String? password;
  String? gender;
  String? birthdate;
  bool? isMember;
  int? point;
  String? date;
  int? iV;
  String? image;
  String? imageId;

  Data(
      {this.sId,
      this.memberId,
      this.patientId,
      this.fullname,
      this.phone,
      this.email,
      this.password,
      this.gender,
      this.birthdate,
      this.isMember,
      this.point,
      this.date,
      this.iV,
      this.image,
      this.imageId});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    memberId = json['memberId'];
    patientId = json['patientId'];
    fullname = json['fullname'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    isMember = json['isMember'];
    point = json['point'];
    date = json['date'];
    iV = json['__v'];
    image = json['image'];
    imageId = json['imageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['memberId'] = memberId;
    data['patientId'] = patientId;
    data['fullname'] = fullname;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['isMember'] = isMember;
    data['point'] = point;
    data['date'] = date;
    data['__v'] = iV;
    data['image'] = image;
    data['imageId'] = imageId;
    return data;
  }
}
