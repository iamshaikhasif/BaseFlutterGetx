

class RefreshTokenResponseModel {
  RefreshTokenResponseModel({
    String? msg,
    bool? success,
    Data? data,}){
    _msg = msg;
    _success = success;
    _data = data;
  }

  RefreshTokenResponseModel.fromJson(dynamic json) {
    _msg = json['msg'];
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _msg;
  bool? _success;
  Data? _data;
  RefreshTokenResponseModel copyWith({  String? msg,
    bool? success,
    Data? data,
  }) => RefreshTokenResponseModel(  msg: msg ?? _msg,
    success: success ?? _success,
    data: data ?? _data,
  );
  String? get msg => _msg;
  bool? get success => _success;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
    String? authToken,}){
    _authToken = authToken;
  }

  Data.fromJson(dynamic json) {
    _authToken = json['authToken'];
  }
  String? _authToken;
  Data copyWith({  String? authToken,
  }) => Data(  authToken: authToken ?? _authToken,
  );
  String? get authToken => _authToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['authToken'] = _authToken;
    return map;
  }

}