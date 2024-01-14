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
  String? transactionId;
  String? patient;
  dynamic doctor;
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
        items?.add(Items.fromJson(v));
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionId'] = transactionId;
    data['patient'] = patient;
    data['doctor'] = doctor;
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    data['payment'] = payment;
    data['status'] = status;
    data['tax'] = tax;
    data['consultationPrice'] = consultationPrice;
    data['totalPrice'] = totalPrice;
    data['mobileOrder'] = mobileOrder;
    data['branch'] = branch;
    data['_id'] = sId;
    data['date'] = date;
    data['__v'] = iV;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['category'] = category;
    data['doctorCommision'] = doctorCommision;
    data['qty'] = qty;
    data['price'] = price;
    data['discount'] = discount;
    data['discountPrice'] = discountPrice;
    data['commisionPrice'] = commisionPrice;
    return data;
  }
}
