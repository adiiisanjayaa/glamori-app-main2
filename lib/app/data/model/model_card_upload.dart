class ModelCardUpload {
  String? patient;
  List<ProductItems>? items;
  String? payment;
  double? tax;
  double? consultationPrice;
  double? totalPrice;

  ModelCardUpload({this.patient, this.items, this.payment, this.tax, this.consultationPrice, this.totalPrice});

  ModelCardUpload.fromJson(Map<String, dynamic> json) {
    patient = json['patient'];
    if (json['items'] != null) {
      items = <ProductItems>[];
      json['items'].forEach((v) {
        items?.add(ProductItems.fromJson(v));
      });
    }
    payment = json['payment'];
    tax = json['tax'];
    consultationPrice = json['consultationPrice'];
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patient'] = patient;
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    data['payment'] = payment;
    data['tax'] = tax;
    data['consultationPrice'] = consultationPrice;
    data['totalPrice'] = totalPrice;
    return data;
  }
}

class ProductItems {
  String? sId;
  String? name;
  int? price;
  int? discount;
  int? discountPrice;
  int? qty;
  String? category;

  ProductItems({this.sId, this.name, this.price, this.discount, this.discountPrice, this.qty, this.category});

  ProductItems.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discountPrice'];
    qty = json['qty'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['price'] = price;
    data['discount'] = discount;
    data['discountPrice'] = discountPrice;
    data['qty'] = qty;
    data['category'] = category;
    return data;
  }
}
