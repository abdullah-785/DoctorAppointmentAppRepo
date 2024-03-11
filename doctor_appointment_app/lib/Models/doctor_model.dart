class DoctorModel {
  String? uid;
  String? name;
  String? specializeIn;
  String? address;
  // String? availabilityTimeTo;
  // String? availabilityTimeFrom;
  String? about;
  String? image;
  

  DoctorModel(
      {this.uid,
      this.name,
      this.specializeIn,
      this.address,
      // this.availabilityTimeTo,
      // this.availabilityTimeFrom,
      this.about,
      this.image,
      
      
      });

  factory DoctorModel.fromMap(map) {
    return DoctorModel(
        uid: map['uid'],
        name: map['name'],
        specializeIn: map['specializeIn'],
        address: map['address'],
        // availabilityTimeTo: map['availabilityTimeTo'],
        // availabilityTimeFrom: map['availabilityTimeFrom'],
        about: map['about'],
        image: map['image'],
        
        
    );

  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'specializeIn': specializeIn,
      'address': address,
      // 'availabilityTime': availabilityTimeTo,
      // 'availabilityTimeFrom': availabilityTimeFrom,
      'about': about,
      'image': image,
      
    };
  }
}
