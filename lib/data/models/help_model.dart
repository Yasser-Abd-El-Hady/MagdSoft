class HelpModel {
  HelpModel({
    this.id,
    this.question,
    this.answer,
  });

  int? id;
  String? question;
  String? answer;

  factory HelpModel.fromJson(Map<String, dynamic> json) => HelpModel(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
      };
}
