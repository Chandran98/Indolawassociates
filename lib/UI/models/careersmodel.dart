// To parse this JSON data, do
//
//     final careersmodel = careersmodelFromJson(jsonString);

import 'dart:convert';

Careersmodel careersmodelFromJson(String str) => Careersmodel.fromJson(json.decode(str));

String careersmodelToJson(Careersmodel data) => json.encode(data.toJson());

class Careersmodel {
    Careersmodel({
        required this.name,
        required this.dateOfBirth,
        required this.employeeId,
        required this.permenantAddress,
        required this.contactAddress,
        required this.mobileNo,
        required this.specialization,
        required this.experience,
        required this.okayToAssociate,
        required this.prefferedArea,
    });

    String name;
    DateTime dateOfBirth;
    String employeeId;
    String permenantAddress;
    String contactAddress;
    String mobileNo;
    String specialization;
    String experience;
    String okayToAssociate;
    String prefferedArea;

    factory Careersmodel.fromJson(Map<String, dynamic> json) => Careersmodel(
        name: json["name"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        employeeId: json["employee_id"],
        permenantAddress: json["permenant_address"],
        contactAddress: json["contact_address"],
        mobileNo: json["mobile_no"],
        specialization: json["specialization"],
        experience: json["experience"],
        okayToAssociate: json["okay_to_associate"],
        prefferedArea: json["preffered_area"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "date_of_birth": dateOfBirth.toIso8601String(),
        "employee_id": employeeId,
        "permenant_address": permenantAddress,
        "contact_address": contactAddress,
        "mobile_no": mobileNo,
        "specialization": specialization,
        "experience": experience,
        "okay_to_associate": okayToAssociate,
        "preffered_area": prefferedArea,
    };
}
