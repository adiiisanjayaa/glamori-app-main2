class ModelPostTransaction {
  int? status;
  String? message;
  Data? data;

  ModelPostTransaction({this.status, this.message, this.data});

  ModelPostTransaction.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  String? transactionId;
  String? patient;
  Null doctor;
  List<Items>? items;
  String? payment;
  String? status;
  int? tax;
  int? consultationPrice;
  int? totalPrice;
  bool? mobileOrder;
  String? branch;
  String? sId;
  String? date;
  int? iV;

  Data(
      {this.transactionId,
      this.patient,
      this.doctor,
      this.items,
      this.payment,
      this.status,
      this.tax,
      this.consultationPrice,
      this.totalPrice,
      this.mobileOrder,
      this.branch,
      this.sId,
      this.date,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    patient = json['patient'];
    doctor = json['doctor'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items?.add(new Items.fromJson(v));
      });
    }
    payment = json['payment'];
    status = json['status'];
    tax = json['tax'];
    consultationPrice = json['consultationPrice'];
    totalPrice = json['totalPrice'];
    mobileOrder = json['mobileOrder'];
    branch = json['branch'];
    sId = json['_id'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionId'] = this.transactionId;
    data['patient'] = this.patient;
    data['doctor'] = this.doctor;
    if (this.items != null) {
      data['items'] = this.items?.map((v) => v.toJson()).toList();
    }
    data['payment'] = this.payment;
    data['status'] = this.status;
    data['tax'] = this.tax;
    data['consultationPrice'] = this.consultationPrice;
    data['totalPrice'] = this.totalPrice;
    data['mobileOrder'] = this.mobileOrder;
    data['branch'] = this.branch;
    data['_id'] = this.sId;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}

class Items {
  String? sId;
  String? name;
  String? category;
  bool? doctorCommision;
  int? qty;
  int? price;
  int? discount;
  int? discountPrice;
  int? commisionPrice;

  Items({this.sId, this.name, this.category, this.doctorCommision, this.qty, this.price, this.discount, this.discountPrice, this.commisionPrice});

  Items.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    category = json['category'];
    doctorCommision = json['doctorCommision'];
    qty = json['qty'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discountPrice'];
    commisionPrice = json['commisionPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['category'] = this.category;
    data['doctorCommision'] = this.doctorCommision;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['discountPrice'] = this.discountPrice;
    data['commisionPrice'] = this.commisionPrice;
    return data;
  }
}
