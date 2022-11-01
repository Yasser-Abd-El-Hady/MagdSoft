class OTPRequest {
  OTPRequest({
    this.phone,
    this.code,
  });

  String? phone;
  String? code;

  factory OTPRequest.fromJson(Map<String, dynamic> json) => OTPRequest(
        phone: json["phone"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "code": code,
      };
}
