class ExtensionModel {
  var id;
  String name;
  var price;
  // var options;

  ExtensionModel({
    this.id,
    this.name,
    this.price,
  });

  ExtensionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;

    return data;
  }
}

class ExtensionName {
  var id;
  String name;
  var option;
  // var options;

  ExtensionName({
    this.id,
    this.name,
    this.option,
  });

  ExtensionName.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    option = json['options'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['option'] = this.option;

    return data;
  }
}
