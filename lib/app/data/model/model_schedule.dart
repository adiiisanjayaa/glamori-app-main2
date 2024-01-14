class ScheduleModel {
  int? status;
  String? message;
  Data? data;

  ScheduleModel({this.status, this.message, this.data});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<DetailDataSchedule>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  int? nextPage;

  Data({this.docs, this.totalDocs, this.limit, this.totalPages, this.page, this.pagingCounter, this.hasPrevPage, this.hasNextPage, this.prevPage, this.nextPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['docs'] != null) {
      docs = <DetailDataSchedule>[];
      json['docs'].forEach((v) {
        docs!.add(DetailDataSchedule.fromJson(v));
      });
    }
    totalDocs = json['totalDocs'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    page = json['page'];
    pagingCounter = json['pagingCounter'];
    hasPrevPage = json['hasPrevPage'];
    hasNextPage = json['hasNextPage'];
    prevPage = json['prevPage'];
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (docs != null) {
      data['docs'] = docs!.map((v) => v.toJson()).toList();
    }
    data['totalDocs'] = totalDocs;
    data['limit'] = limit;
    data['totalPages'] = totalPages;
    data['page'] = page;
    data['pagingCounter'] = pagingCounter;
    data['hasPrevPage'] = hasPrevPage;
    data['hasNextPage'] = hasNextPage;
    data['prevPage'] = prevPage;
    data['nextPage'] = nextPage;
    return data;
  }
}

class DetailDataSchedule {
  String? sId;
  String? scheduleDate;
  Patient? patient;
  Patient? doctor;
  Transaction? transaction;
  bool? isVirtual;
  String? status;
  String? notes;
  dynamic virtualUrl;
  String? branch;
  String? date;
  int? iV;
  String? diagnosis;

  DetailDataSchedule(
      {this.sId, this.scheduleDate, this.patient, this.doctor, this.transaction, this.isVirtual, this.status, this.notes, this.virtualUrl, this.branch, this.date, this.iV, this.diagnosis});

  DetailDataSchedule.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    scheduleDate = json['scheduleDate'];
    patient = json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    doctor = json['doctor'] != null ? Patient.fromJson(json['doctor']) : null;
    transaction = json['transaction'] != null ? Transaction.fromJson(json['transaction']) : null;
    isVirtual = json['isVirtual'];
    status = json['status'];
    notes = json['notes'];
    virtualUrl = json['virtualUrl'];
    branch = json['branch'];
    date = json['date'];
    iV = json['__v'];
    diagnosis = json['diagnosis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['scheduleDate'] = scheduleDate;
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    if (transaction != null) {
      data['transaction'] = transaction!.toJson();
    }
    data['isVirtual'] = isVirtual;
    data['status'] = status;
    data['notes'] = notes;
    data['virtualUrl'] = virtualUrl;
    data['branch'] = branch;
    data['date'] = date;
    data['__v'] = iV;
    data['diagnosis'] = diagnosis;
    return data;
  }
}

class Patient {
  String? sId;
  String? fullname;

  Patient({this.sId, this.fullname});

  Patient.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullname = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['fullname'] = fullname;
    return data;
  }
}

class Transaction {
  String? sId;
  String? transactionId;
  List<Items>? items;
  String? status;

  Transaction({this.sId, this.transactionId, this.items, this.status});

  Transaction.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    transactionId = json['transactionId'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['transactionId'] = transactionId;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Items {
  String? sId;
  String? treatmentRef;
  String? name;
  String? category;
  bool? doctorCommision;
  int? qty;
  int? price;
  int? discount;
  int? discountPrice;
  int? commisionPrice;
  String? notes;
  String? balanceRef;

  Items({this.sId, this.treatmentRef, this.name, this.category, this.doctorCommision, this.qty, this.price, this.discount, this.discountPrice, this.commisionPrice, this.notes, this.balanceRef});

  Items.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    treatmentRef = json['treatmentRef'];
    name = json['name'];
    category = json['category'];
    doctorCommision = json['doctorCommision'];
    qty = json['qty'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discountPrice'];
    commisionPrice = json['commisionPrice'];
    notes = json['notes'];
    balanceRef = json['balanceRef'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['treatmentRef'] = treatmentRef;
    data['name'] = name;
    data['category'] = category;
    data['doctorCommision'] = doctorCommision;
    data['qty'] = qty;
    data['price'] = price;
    data['discount'] = discount;
    data['discountPrice'] = discountPrice;
    data['commisionPrice'] = commisionPrice;
    data['notes'] = notes;
    data['balanceRef'] = balanceRef;
    return data;
  }
}
