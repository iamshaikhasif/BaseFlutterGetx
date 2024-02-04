
class RefreshTokenRequestModel {
  RefreshTokenRequestModel({
    String? appVersion,
    String? deviceModel,
    String? osVersion,}){
    _appVersion = appVersion;
    _deviceModel = deviceModel;
    _osVersion = osVersion;
  }

  RefreshTokenRequestModel.fromJson(dynamic json) {
    _appVersion = json['appVersion'];
    _deviceModel = json['deviceModel'];
    _osVersion = json['osVersion'];
  }
  String? _appVersion;
  String? _deviceModel;
  String? _osVersion;
  RefreshTokenRequestModel copyWith({  String? appVersion,
    String? deviceModel,
    String? osVersion,
  }) => RefreshTokenRequestModel(  appVersion: appVersion ?? _appVersion,
    deviceModel: deviceModel ?? _deviceModel,
    osVersion: osVersion ?? _osVersion,
  );
  String? get appVersion => _appVersion;
  String? get deviceModel => _deviceModel;
  String? get osVersion => _osVersion;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appVersion'] = _appVersion;
    map['deviceModel'] = _deviceModel;
    map['osVersion'] = _osVersion;
    return map;
  }

}