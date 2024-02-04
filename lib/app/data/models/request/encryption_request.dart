class EncryptionRequestModel {
  EncryptionRequestModel({
    this.str,});

  EncryptionRequestModel.fromJson(dynamic json) {
    str = json['str'] != null ? json['str'].cast<String>() : [];
  }
  List<String>? str;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['str'] = str;
    return map;
  }

}