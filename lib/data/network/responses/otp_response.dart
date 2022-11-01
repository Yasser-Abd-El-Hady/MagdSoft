import '../../models/account_model.dart';

class OtpResponseModel {
  OtpResponseModel({
    this.status,
    this.message,
    this.account,
  });

  int? status;
  String? message;
  AccountModel? account;

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) =>
      OtpResponseModel(
        status: json["status"],
        message: json["message"],
        account: json['account'] == null
            ? null
            : AccountModel.fromJson(json["account"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "account": account!.toJson(),
      };
}
