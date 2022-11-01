class SignInResponse {
  SignInResponse({
    this.status,
    this.message,
    this.code,
  });

  int? status;
  String? message;
  String? code;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        status: json["status"],
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
      };
}
