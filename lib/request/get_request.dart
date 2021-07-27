class Get {
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  String? phone;
  int? carID;

  Get(
      {this.id,
        this.firstName,
        this.lastName,
        this.username,
        this.phone,
        this.carID});

  Get.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    phone = json['phone'];
    carID = json['carID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['carID'] = this.carID;
    return data;
  }
}