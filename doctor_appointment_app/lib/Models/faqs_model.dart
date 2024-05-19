class FaqsModel {
  String? uid;
  String? title;
  String? description;

  FaqsModel({
    this.uid,
    this.title,
    this.description,
  });

  factory FaqsModel.fromMap(map) {
    return FaqsModel(
      uid: map['uid'],
      title: map['title'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'description': description,
    };
  }
}
