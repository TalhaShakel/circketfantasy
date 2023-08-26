class MatchModel {
  int? status;
  List<Data>? data;

  MatchModel({this.status, this.data});

  MatchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? series;
  String? url;
  String? time;
  String? venu;
  bool? status;
  String? team1img;
  String? team2img;
  String? team1;
  String? team2;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.sId,
      this.name,
      this.series,
      this.url,
      this.time,
      this.venu,
      this.status,
      this.team1img,
      this.team2img,
      this.team1,
      this.team2,
      this.iV,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    series = json['series'];
    url = json['url'];
    time = json['time'];
    venu = json['venu'];
    status = json['status'];
    team1img = json['team1img'];
    team2img = json['team2img'];
    team1 = json['team1'];
    team2 = json['team2'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['series'] = this.series;
    data['url'] = this.url;
    data['time'] = this.time;
    data['venu'] = this.venu;
    data['status'] = this.status;
    data['team1img'] = this.team1img;
    data['team2img'] = this.team2img;
    data['team1'] = this.team1;
    data['team2'] = this.team2;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
