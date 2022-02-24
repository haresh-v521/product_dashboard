/// id : 4
/// token : "QpwL5tke4Pnpja7X4"

class De {
  De({
      int? id, 
      String? token,}){
    _id = id;
    _token = token;
}

  De.fromJson(dynamic json) {
    _id = json['id'];
    _token = json['token'];
  }
  int? _id;
  String? _token;

  int? get id => _id;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['token'] = _token;
    return map;
  }

}