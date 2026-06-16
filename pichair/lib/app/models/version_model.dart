class VersionModel {
String tagName;
String name;

VersionModel({required this.tagName, required this.name});

factory VersionModel.fromJson(dynamic json) {
    return VersionModel(
        tagName: json['tag_name'],
        name: json['name'],
    );
}

Map<String, dynamic> toJson() {
    return {
        'tag_name': tagName,
        'name': name,
    };
}
}