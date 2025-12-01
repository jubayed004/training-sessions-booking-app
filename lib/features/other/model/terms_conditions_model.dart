class TermsConditionsModel {
  final num? statusCode;
  final bool? success;
  final String? message;
  final Data? data;

  TermsConditionsModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory TermsConditionsModel.fromJson(Map<String, dynamic> json) => TermsConditionsModel(
    statusCode: json["statusCode"]?.toInt(),
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );
}

class Data {
  final String? id;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final num? v;

  Data({
    this.id,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    description: json["description"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"]?.toInt(),
  );
}
