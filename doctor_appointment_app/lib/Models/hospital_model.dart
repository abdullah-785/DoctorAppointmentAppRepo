class HospitalModel {
  String? uid;
  String? name;
  String? specializeIn;
  String? address;
  String? description;
  // String? availabilityTimeTo;
  // String? availabilityTimeFrom;
  String? websiteLink;
  String? contactNumber;
  String? call;
  String? image;
  List<String>? gallary;

  HospitalModel({
    this.uid,
    this.name,
    this.specializeIn,
    this.address,
    this.description,
    // this.availabilityTimeTo,
    // this.availabilityTimeFrom,
    this.websiteLink,
    this.contactNumber,
    this.call,
    this.image,
    this.gallary,
  });

  factory HospitalModel.fromMap(map) {
    return HospitalModel(
      uid: map['uid'],
      name: map['name'],
      specializeIn: map['specializeIn'],
      address: map['address'],
      description: map['description'],
      // availabilityTimeTo: map['availabilityTimeTo'],
      // availabilityTimeFrom: map['availabilityTimeFrom'],
      websiteLink: map['websiteLink'],
      contactNumber: map['contactNumber'],
      call: map['call'],
      image: map['image'],
      gallary: map['gallary'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'specializeIn': specializeIn,
      'address': address,
      'description': description,
      // 'availabilityTime': availabilityTimeTo,
      // 'availabilityTimeFrom': availabilityTimeFrom,
      'websiteLink': websiteLink,
      'contactNumber': contactNumber,
      'call': call,
      'image': image,
      'gallary': gallary,
    };
  }
}
