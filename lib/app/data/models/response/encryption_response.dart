import 'package:base_project_getx/app/data/models/response/common_response.dart';

class EncryptionResponseModel extends CommonResponse{
  EncryptionResponseModel({
    this.data,
  });

  EncryptionResponseModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(EncryptionResponseData.fromJson(v));
      });
    }
  }

  List<EncryptionResponseData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }

    return map;
  }
}

class EncryptionResponseData {
  EncryptionResponseData({
    this.encryptedStr,
    this.decryptedStr,});

  EncryptionResponseData.fromJson(dynamic json) {
    encryptedStr = json['encryptedStr'];
    decryptedStr = json['decryptedStr'];
  }
  String? encryptedStr;
  String? decryptedStr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['encryptedStr'] = encryptedStr;
    map['decryptedStr'] = decryptedStr;
    return map;
  }

}