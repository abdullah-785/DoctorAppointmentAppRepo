class UserModel {
  String? uid;
  String? name;
  String? email;
  String? password;
  String? image;
  String? phone;
  String? dob;
  String? gender;
  String? address;
  String? role;

  UserModel(
      {this.uid,
      this.name,
      this.email,
      this.password,
      this.image,
      this.dob,
      this.gender,
      this.phone,
      this.address,
      this.role});

  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        name: map['name'],
        email: map['email'],
        password: map['password'],
        image: map['image'],
        dob: map['dob'],
        gender: map['gender'],
        phone: map['phone'],
        address: map['address'],
        role: map['role']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      'image': image,
      'dob': dob,
      'gender': gender,
      'phone': phone,
      'address': address,
      'role': role
    };
  }
}
