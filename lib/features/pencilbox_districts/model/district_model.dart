class District {
  String? id;
  String? divisionId;
  String? name;
  String? bnName;
  String? lat;
  String? lon;
  String? url;

  District({this.id, this.divisionId, this.name, this.bnName, this.lat, this.lon, this.url});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    divisionId = json['division_id'];
    name = json['name'];
    bnName = json['bn_name'];
    lat = json['lat'];
    lon = json['lon'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['division_id'] = divisionId;
    data['name'] = name;
    data['bn_name'] = bnName;
    data['lat'] = lat;
    data['lon'] = lon;
    data['url'] = url;
    return data;
  }
}
