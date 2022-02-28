/// token : "QpwL5tke4Pnpja7X4"

class Login {
  Login({
      String? token,}){
    _token = token;
}

  Login.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;

  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }

}