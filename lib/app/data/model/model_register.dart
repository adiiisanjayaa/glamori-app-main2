class ModelRegister {
  int? status;
  String? message;
  Data? data;

  ModelRegister({this.status, this.message, this.data});

  ModelRegister.fromJson(Map<String, dynamic> json) {
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
  String? memberId;
  String? patientId;
  String? fullname;
  String? phone;
  String? password;
  String? gender;
  String? birthdate;
  bool? isMember;
  int? point;
  String? sId;
  String? date;
  int? iV;

  Data({this.memberId, this.patientId, this.fullname, this.phone, this.password, this.gender, this.birthdate, this.isMember, this.point, this.sId, this.date, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    memberId = json['memberId'];
    patientId = json['patientId'];
    fullname = json['fullname'];
    phone = json['phone'];
    password = json['password'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    isMember = json['isMember'];
    point = json['point'];
    sId = json['_id'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['memberId'] = memberId;
    data['patientId'] = patientId;
    data['fullname'] = fullname;
    data['phone'] = phone;
    data['password'] = password;
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['isMember'] = isMember;
    data['point'] = point;
    data['_id'] = sId;
    data['date'] = date;
    data['__v'] = iV;
    return data;
  }
}
