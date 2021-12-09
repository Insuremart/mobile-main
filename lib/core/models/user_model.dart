// class UserModel {
//   String fullname;
//   String phone;
//   String email;
//   String password;
//   String imei;
//   String lng;
//   String lat;

//   UserModel(
//       {this.fullname,
//       this.phone,
//       this.email,
//       this.password,
//       this.imei,
//       this.lng,
//       this.lat});

//   UserModel.fromJson(Map<String, dynamic> json) {
//     fullname = json['fullname'];
//     phone = json['phone'];
//     email = json['email'];
//     password = json['password'];
//     imei = json['imei'];
//     lng = json['lng'];
//     lat = json['lat'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['fullname'] = this.fullname;
//     data['phone'] = this.phone;
//     data['email'] = this.email;
//     data['password'] = this.password;
//     data['imei'] = this.imei;
//     data['lng'] = this.lng;
//     data['lat'] = this.lat;
//     return data;
//   }
// }
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };

  getUser(UserModel userModel) {
    success = userModel.success;
    data = userModel.data;
  }
}

class Data {
  Data({
    this.token,
    this.user,
    this.address,
    this.channel,
    this.profile_url,
    this.data,
    this.bio,
    this.email,
    this.id,
    this.hasSubscription,
    this.idCard,
    this.is_bot,
    this.language_code,
    this.otp,
    this.phone,
    this.provider,
    this.userType,
    this.utilityBill,
  });

  dynamic token;
  dynamic user;
  dynamic userType;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  dynamic profile_url;
  dynamic provider;
  dynamic address;
  dynamic idCard;
  dynamic bio ;
  dynamic utilityBill;
  dynamic hasSubscription;
  dynamic channel;
  dynamic otp;
  dynamic is_bot;
  dynamic language_code;
  dynamic id;
  dynamic phone;
  dynamic email;
  dynamic data;
  // dynamic accessToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        token: json["token"],
        userType: json["userType"],
        profile_url: json["profile_url"],
        provider: json["provider"],
        address: json["address"] ,
        idCard: json["idCard"],
        bio: json["bio"],
        utilityBill: json["utilityBill"],
        hasSubscription: json["hasSubscription"],
        channel: json["channel"],
        otp: json["otp"],
        is_bot: json["is_bot"],
        language_code: json["language_code"],
        phone: json["phone"], 
        email: json["email"],
        data: json["data"],  
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "userType": userType,
        "profile_url": profile_url,
        "provider": provider,
        "address": address,
        "idCard": idCard,
        "bio": bio,
        "utilityBill": utilityBill,
        "hasSubscription": hasSubscription,
        "channel": channel,
        "otp": otp,
        "is_bot": is_bot,
        "language_code": language_code,
        "phone": phone,
        "email": email,
        "data": data,
      };
}









