class SuccessModel {
  SuccessModel({
    // this.type,
     this.message});

  SuccessModel.fromJson(dynamic json) {
    // type = json['type'] as String;
    message = json['success'] as String;
  }

  String type;
  String message;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['type'] = type;
    data['success'] = message;
    return data;
  }
}
