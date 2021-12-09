class Company {
  var id;
  String name;
  String image;
  String policy_year;
  String cover_number;
  var price;
  // var options;

  Company(
      {this.id, this.name, this.image, this.policy_year, this.cover_number, this.price});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    policy_year = json['policy_year'];
    cover_number = json['cover_number'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['policy_year'] = this.policy_year;
    data['cover_number'] = this.cover_number;
    data['price'] = this.price;

    return data;
  }
}
