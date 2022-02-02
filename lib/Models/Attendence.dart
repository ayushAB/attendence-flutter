// To parse this JSON data, do
//
//     final attendence = attendenceFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Attendence attendenceFromJson(String str) =>
    Attendence.fromJson(json.decode(str));

String attendenceToJson(Attendence data) => json.encode(data.toJson());

class Attendence {
  Attendence({
    required this.userId,
    required this.empCode,
    required this.deviceDetails,
    required this.timeStamp,
    required this.isCheckIn,
    required this.id,
    required this.createdBy,
    required this.createdDate,
    required this.updatedBy,
    required this.updatedDate,
    required this.deletedBy,
    required this.deletedDate,
  });

  String userId;
  String empCode;
  dynamic deviceDetails;
  DateTime timeStamp;
  bool isCheckIn;
  String id;
  dynamic createdBy;
  dynamic createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  dynamic deletedBy;
  dynamic deletedDate;

  factory Attendence.fromJson(Map<String, dynamic> json) => Attendence(
        userId: json["UserId"],
        empCode: json["EmpCode"],
        deviceDetails: json["DeviceDetails"],
        timeStamp: DateTime.parse(json["TimeStamp"]),
        isCheckIn: json["IsCheckIn"],
        id: json["Id"],
        createdBy: json["CreatedBy"],
        createdDate: json["CreatedDate"],
        updatedBy: json["UpdatedBy"],
        updatedDate: json["UpdatedDate"],
        deletedBy: json["DeletedBy"],
        deletedDate: json["DeletedDate"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "EmpCode": empCode,
        "DeviceDetails": deviceDetails,
        "TimeStamp": timeStamp.toIso8601String(),
        "IsCheckIn": isCheckIn,
        "Id": id,
        "CreatedBy": createdBy,
        "CreatedDate": createdDate,
        "UpdatedBy": updatedBy,
        "UpdatedDate": updatedDate,
        "DeletedBy": deletedBy,
        "DeletedDate": deletedDate,
      };
}
