import '../../models/help_model.dart';

class HelpResponse {
  HelpResponse({
    this.status,
    this.message,
    this.help,
  });

  int? status;
  String? message;
  List<HelpModel>? help;

  factory HelpResponse.fromJson(Map<String, dynamic> json) => HelpResponse(
        status: json["status"],
        message: json["message"],
        help: List<HelpModel>.from(
            json["help"].map((x) => HelpModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "help": List<HelpModel>.from(help!.map((x) => x.toJson())),
      };
}
