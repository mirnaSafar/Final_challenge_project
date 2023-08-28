class QuestionModel {
  String? textQuestions;
  int? mark;
  String? link;
  Answers? answers;
  String? correctAnswer;
  String? createdAt;
  String? updatedAt;

  QuestionModel(
      {this.textQuestions,
      this.mark,
      this.link,
      this.answers,
      this.correctAnswer,
      this.createdAt,
      this.updatedAt});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    textQuestions = json['text_questions'];
    mark = json['mark'];
    link = json['link'];
    answers =
        json['answers'] != null ? new Answers.fromJson(json['answers']) : null;
    correctAnswer = json['correct_answer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text_questions'] = this.textQuestions;
    data['mark'] = this.mark;
    data['link'] = this.link;
    if (this.answers != null) {
      data['answers'] = this.answers!.toJson();
    }
    data['correct_answer'] = this.correctAnswer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Answers {
  String? s1;
  String? s2;
  String? s3;
  String? s4;

  Answers({this.s1, this.s2, this.s3, this.s4});

  Answers.fromJson(Map<String, dynamic> json) {
    s1 = json['الجواب_الاول'];
    s2 = json['الجواب_الثالث'];
    s3 = json['الجواب_الثاني'];
    s4 = json['الجواب_الرابع'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['الجواب_الاول'] = this.s1;
    data['الجواب_الثالث'] = this.s2;
    data['الجواب_الثاني'] = this.s3;
    data['الجواب_الرابع'] = this.s4;
    return data;
  }
}
