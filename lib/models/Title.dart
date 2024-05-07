import 'dart:convert';

List<Title> titleFromJson(String str) => List<Title>.from(json.decode(str).map((x) => Title.fromJson(x)));

String titleToJson(List<Title> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Title {
    int? id;
    String? name;
    String? lastname;
    String? birthOfDay;
    String? dianosis;
    String? allergy;

    Title({
        this.id,
        this.name,
        this.lastname,
        this.birthOfDay,
        this.dianosis,
        this.allergy,
    });

    factory Title.fromJson(Map<String, dynamic> json) => Title(
        id: json["id"],
        name: json["name"],
        lastname: json["lastname"],
        birthOfDay: json["birth_of_day"],
        dianosis: json["dianosis"],
        allergy: json["allergy"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "birth_of_day": birthOfDay,
        "dianosis": dianosis,
        "allergy": allergy,
    };
}
