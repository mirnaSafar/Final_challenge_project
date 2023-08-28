import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/college_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/models/subjects_model.dart';
import 'package:flutter_templete/core/data/network/endpoints/college_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class CollegeRepository {
  Future<Either<String, List<CollegeModel>>> getAllColleges(
      {bool? med = false, bool? eng = false}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: eng!
            ? CollegeEndpoints.getEngCollages
            : med!
                ? CollegeEndpoints.getMecdicalCollages
                : CollegeEndpoints.getAll,
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.GET),
      ).then((response) {
        List<CollegeModel> colleges = [];
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          for (var element in commonResponse.data!['data']['collages']) {
            colleges.add(CollegeModel.fromJson(element));
          }
          return Right(colleges);
        } else {
          return Left(commonResponse.message ?? "");
        }
      });
    } catch (e) {
      return Left(e.toString());
//object
    }
  }

  Future<Either<String, List<CollegeModel>>> getEngColleges() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: CollegeEndpoints.getAll,
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.GET),
      ).then((response) {
        List<CollegeModel> colleges = [];
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          for (var element in commonResponse.data!['data']['collage']) {
            colleges.add(CollegeModel.fromJson(element));
          }
          return Right(colleges);
        } else {
          return Left(commonResponse.message ?? "");
        }
      });
    } catch (e) {
      return Left(e.toString());
//object
    }
  }

  Future<Either<String, List<CollegeModel>>> getMedColleges() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: CollegeEndpoints.getAll,
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.GET),
      ).then((response) {
        List<CollegeModel> colleges = [];
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          for (var element in commonResponse.data!['data']['collage']) {
            colleges.add(CollegeModel.fromJson(element));
          }
          return Right(colleges);
        } else {
          return Left(commonResponse.message ?? "");
        }
      });
    } catch (e) {
      return Left(e.toString());
//object
    }
  }

  Future<Either<String, List<SubjectModel>>> getCollegeSubjects(
      {required collegeID}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: CollegeEndpoints.collegeSubjects + collegeID,
        headers:
            NetworkConfig.getHeaders(needAuth: true, type: RequestType.GET),
      ).then((response) {
        List<SubjectModel> collegeSubjects = [];
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          for (var element in commonResponse.data!['data']['items']) {
            collegeSubjects.add(SubjectModel.fromJson(element));
          }
          return Right(collegeSubjects);
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
