class SignInRequest {
  SignInRequest({
    this.name,
    this.phone,
  });

  String? name;
  String? phone;

  factory SignInRequest.fromJson(Map<String, dynamic> json) => SignInRequest(
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
      };
}
