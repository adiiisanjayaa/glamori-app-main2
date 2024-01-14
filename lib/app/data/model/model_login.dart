class ModelLogin {
  int? status;
  String? message;
  Data? data;

  ModelLogin({this.status, this.message, this.data});

  ModelLogin.fromJson(Map<String, dynamic> json) {
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
  String? accessToken;
  Patient? patient;

  Data({this.accessToken, this.patient});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    patient = json['patient'] != null ? Patient.fromJson(json['patient']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    if (patient != null) {
      data['patient'] = patient?.toJson();
    }
    return data;
  }
}

class Patient {
  int? point;
  String? sId;
  String? memberId;
  String? patientId;
  String? fullname;
  String? phone;
  String? email;
  String? address;
  String? image;
  String? imageId;
  String? gender;
  String? birthdate;
  bool? isMember;
  String? date;
  int? iV;
  String? password;

  Patient(
      {this.point,
      this.sId,
      this.memberId,
      this.patientId,
      this.fullname,
      this.phone,
      this.email,
      this.address,
      this.image,
      this.imageId,
      this.gender,
      this.birthdate,
      this.isMember,
      this.date,
      this.iV,
      this.password});

  Patient.fromJson(Map<String, dynamic> json) {
    point = json['point'];
    sId = json['_id'];
    memberId = json['memberId'];
    patientId = json['patientId'];
    fullname = json['fullname'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    image = json['image'];
    imageId = json['imageId'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    isMember = json['isMember'];
    date = json['date'];
    iV = json['__v'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['point'] = point;
    data['_id'] = sId;
    data['memberId'] = memberId;
    data['patientId'] = patientId;
    data['fullname'] = fullname;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['image'] = image;
    data['imageId'] = imageId;
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['isMember'] = isMember;
    data['date'] = date;
    data['__v'] = iV;
    data['password'] = password;
    return data;
  }
}
