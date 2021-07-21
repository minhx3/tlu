class UniversityInfo {
  UniversityInfo({
    this.address,
    this.code,
    this.dateOfEstablishment,
    this.fullName,
    this.id,
    this.universityInfoId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String address;
  String code;
  String dateOfEstablishment;
  String fullName;
  String id;
  String universityInfoId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory UniversityInfo.fromJson(Map<String, dynamic> json) => UniversityInfo(
        address: json["address"] == null ? null : json["address"],
        code: json["code"] == null ? null : json["code"],
        dateOfEstablishment: json["dateOfEstablishment"] == null
            ? null
            : json["dateOfEstablishment"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        id: json["_id"] == null ? null : json["_id"],
        universityInfoId: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "address": address == null ? null : address,
        "code": code == null ? null : code,
        "dateOfEstablishment":
            dateOfEstablishment == null ? null : dateOfEstablishment,
        "fullName": fullName == null ? null : fullName,
        "_id": id == null ? null : id,
        "id": universityInfoId == null ? null : universityInfoId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
