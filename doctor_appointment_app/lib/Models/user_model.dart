class UserModel {
  String? uid;
  String? name;
  String? email;
  String? password;
  // String? phone;
  // String? address;
  String? role;

  UserModel(
      {this.uid,
      this.name,
      this.email,
      this.password,
      // this.phone,
      // this.address,
      this.role});

  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        name: map['name'],
        email: map['email'],
        password: map['password'],
        // phone: map['phone'],
        // address: map['address'],
        role: map['role']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      // 'phone': phone,
      // 'address': address,
      'role': role
    };
  }
}
