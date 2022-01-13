import 'dart:convert';

SupportLoginVo supportLoginVoFromJson(String str) => SupportLoginVo.fromJson(json.decode(str));

String supportLoginVoToJson(SupportLoginVo data) => json.encode(data.toJson());

class SupportLoginVo {
  SupportLoginVo({
   required this.status,
   required this.responseCode,
   required this.description,
   required this.token,
  });

  String? status;
  String? responseCode;
  String? description;
  String? token;

  factory SupportLoginVo.fromJson(Map<String, dynamic> json) => SupportLoginVo(
    status: json["status"],
    responseCode: json["response_code"],
    description: json["description"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response_code": responseCode,
    "description": description,
    "token": token,
  };
}
