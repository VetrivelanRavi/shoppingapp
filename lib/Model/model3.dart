class Model3 {
  String? home;
  String? description;
  String? icon;

  Model3({this.home, this.description, this.icon});

  Model3.fromJson(Map<String, dynamic> json) {
    home = json['Home'];
    description = json['Description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Home'] = this.home;
    data['Description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}
