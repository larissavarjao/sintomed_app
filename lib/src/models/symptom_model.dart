class Symptom {
  String id;
  DateTime happenedAt;
  dynamic durationSeconds; // int or null
  dynamic observation; // String or null
  String userId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt; // DateTime or null
  dynamic symptomGenericId; // String or null
  dynamic symptomUserId; // String or null
  String name;
  String description;
  dynamic classification; // String or null
  String typeId;
  String typeName;

  Symptom(
      {this.id,
      this.happenedAt,
      this.durationSeconds,
      this.observation,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.symptomGenericId,
      this.symptomUserId,
      this.name,
      this.description,
      this.classification,
      this.typeId,
      this.typeName});

  Symptom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    happenedAt = DateTime.parse(json['happenedAt']);
    durationSeconds = json['durationSeconds'];
    observation = json['observation'];
    userId = json['userId'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
    deletedAt =
        json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null;
    symptomGenericId = json['symptomGenericId'];
    symptomUserId = json['symptomUserId'];
    name = json['name'];
    description = json['description'];
    classification = json['classification'];
    typeId = json['typeId'];
    typeName = json['typeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['happenedAt'] = this.happenedAt;
    data['durationSeconds'] = this.durationSeconds;
    data['observation'] = this.observation;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['symptomGenericId'] = this.symptomGenericId;
    data['symptomUserId'] = this.symptomUserId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['classification'] = this.classification;
    data['typeId'] = this.typeId;
    data['typeName'] = this.typeName;
    return data;
  }
}
