class ModelGetAllProduct {
  int? status;
  List<Data>? data;
  String? message;

  ModelGetAllProduct({this.status, this.data, this.message});

  ModelGetAllProduct.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? image;
  String? imageId;
  int? price;
  String? description;
  bool? isAvailable;
  int? stock;
  int? point;
  String? date;
  int? iV;

  Data({this.sId, this.name, this.image, this.imageId, this.price, this.description, this.isAvailable, this.stock, this.point, this.date, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    imageId = json['imageId'];
    price = json['price'];
    description = json['description'];
    isAvailable = json['isAvailable'];
    stock = json['stock'];
    point = json['point'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['image'] = image;
    data['imageId'] = imageId;
    data['price'] = price;
    data['description'] = description;
    data['isAvailable'] = isAvailable;
    data['stock'] = stock;
    data['point'] = point;
    data['date'] = date;
    data['__v'] = iV;
    return data;
  }
}
