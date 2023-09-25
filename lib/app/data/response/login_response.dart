class LoginResponse {
  String? token;
  String? error;

  LoginResponse({this.token, this.error});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['error'] = this.error;
    return data;
  }
}
