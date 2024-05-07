import 'dart:convert';

List<Details> detailsFromJson(String str) => List<Details>.from(json.decode(str).map((x) => Details.fromJson(x)));

String detailsToJson(List<Details> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Details {
    int? id;
    String? instruction;
    String? morning;
    String? afternoon;
    String? evening;
    String? atBedTime;
    String? doctor;
    String? img;

    Details({
        this.id,
        this.instruction,
        this.morning,
        this.afternoon,
        this.evening,
        this.atBedTime,
        this.doctor,
        this.img,
    });

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json["id"],
        instruction: json["instruction"],
        morning: json["Morning"],
        afternoon: json["Afternoon"],
        evening: json["Evening"],
        atBedTime: json["At_bed_time"],
        doctor: json["Doctor"],
        img: json["IMG"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "instruction": instruction,
        "Morning": morning,
        "Afternoon": afternoon,
        "Evening": evening,
        "At_bed_time": atBedTime,
        "Doctor": doctor,
        "IMG": img,
    };
}