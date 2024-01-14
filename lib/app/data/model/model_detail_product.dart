import 'package:glamori/app/data/database/cart_table.dart';

class ModelDetailProduct {
  int? status;
  String? message;
  Data? data;
  int? qty;
  int? checked;

  ModelDetailProduct({this.status, this.message, this.data, this.qty, this.checked});

  ModelDetailProduct.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toSqlite() {
    // String? userId = UserService.find.user?.id;
    final map = <String, dynamic>{};
    map[CartTable.COL_ID] = data?.sId;
    map[CartTable.COL_TITLE] = data?.name;
    map[CartTable.COL_DESC] = data?.description;
    map[CartTable.COL_IMAGE_URL] = data?.image;
    map[CartTable.COL_PRICE] = data?.price ?? 0;
    map[CartTable.COL_QTY] = (qty ?? 0) + 1;
    map[CartTable.COL_CHECKED] = 0;
    return map;
  }

  factory ModelDetailProduct.fromSqlite(Map<String, dynamic> data) => ModelDetailProduct(
        status: 200,
        message: 'Success',
        data: Data(
          sId: data[CartTable.COL_ID],
          name: data[CartTable.COL_TITLE],
          description: data[CartTable.COL_DESC],
          price: data[CartTable.COL_PRICE],
          image: data[CartTable.COL_IMAGE_URL],
        ),
        qty: data[CartTable.COL_QTY],
        checked: data[CartTable.COL_CHECKED],
      );
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
