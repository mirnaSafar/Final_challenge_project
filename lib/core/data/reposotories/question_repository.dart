import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/question_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/question_endpoints.dart';

import '../../enums/request_type.dart';
import '../../utils/network_util.dart';
import '../models/common_response.dart';
import '../network/network_config.dart';

class QuestionsRepository {
  Future<Either<String, List<QuestionModel>>> getBookQuestions(
      {required collegeID}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: QuestionEndpoints.getBookQuestions + collegeID,
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.GET),
      ).then((response) {
        List<QuestionModel> questions = [];
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          for (var element in commonResponse.data!['data']["Questions_book"]) {
            questions.add(QuestionModel.fromJson(element));
          }
          return Right(questions);
        } else {
          return Left(commonResponse.message ?? "");
        }
      });
    } catch (e) {
      return Left(e.toString());
//object
    }
  }
}
