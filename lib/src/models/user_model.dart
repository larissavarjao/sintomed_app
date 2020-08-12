class User {
  String id;
  String firstName;
  dynamic lastName; // dynamic or null
  String pacientName;
  String email;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.pacientName,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    pacientName = json['pacientName'];
    email = json['email'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
    deletedAt =
        json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['pacientName'] = this.pacientName;
    data['email'] = this.email;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}
