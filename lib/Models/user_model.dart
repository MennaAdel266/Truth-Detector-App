class UserModel{
  String name = 'Norhan Ali';
  String email;
  String phone = '01265748392';
  String address = 'Nasr city';
  String uId;
  String comment = 'comment';
  String message = 'message';
  String galleryImage;
  bool isEmailVerified;

  UserModel({
    this.email,
    this.phone,
    this.name,
    this.address,
    this.uId,
    this.comment,
    this.message,
    this.galleryImage,
    this.isEmailVerified,
  });

  UserModel.fromJson(Map<String, dynamic> json){
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    uId = json['uId'];
    comment = json['comment'];
    message = json['message'];
    galleryImage = json['galleryImage'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap()
  {
    return{
      'email': email,
      'name': name,
      'phone': phone,
      'address': address,
      'uId' : uId,
      'comment' : comment,
      'message' : message,
      'galleryImage' : galleryImage,
      'isEmailVerified' : isEmailVerified,
    };
  }

}