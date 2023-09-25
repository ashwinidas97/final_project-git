class RegResponse {
  int? id;
  String? token;
  String? error;

  RegResponse({this.id,this.token, this.error});

  RegResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['error'] = this.error;
    return data;
  }
}