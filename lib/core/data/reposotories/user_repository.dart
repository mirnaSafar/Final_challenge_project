import 'package:dartz/dartz.dart';
import 'package:flutter_templete/core/data/models/apis/login_model.dart';
import 'package:flutter_templete/core/data/models/apis/register_model.dart';
import 'package:flutter_templete/core/data/models/common_response.dart';
import 'package:flutter_templete/core/data/network/endpoints/user_endpoints.dart';
import 'package:flutter_templete/core/data/network/network_config.dart';
import 'package:flutter_templete/core/enums/request_type.dart';
import 'package:flutter_templete/core/utils/network_util.dart';

class UserRepository {
  Future<Either<String, LoginModel>> Login({
    required String name,
    required String code,
  }) async {
    try {
      return NetworkUtil.SendMultipartRequest(
          requestType: RequestType.POST,
          url: UserEndpoints.login,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          fields: {
            'name': name,
            'code': code,
          }).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          return Right(
            LoginModel.fromJson(commonResponse.data!['data']),
          );
        } else {
          return Left(commonResponse.message ?? "");
        }
      });
    } catch (e) {
      return Left(e.toString());
//object
    }
  }

  Future<Either<String, RegisterModel>> register({
    // required String email,
    // required String password,
    required String collage_id,
    required String name,
    required String phone,
  }) async {
    try {
      return NetworkUtil.SendMultipartRequest(
        requestType: RequestType.POST,
        url: UserEndpoints.register,
        fields: {
          'name': name,
          'phone': phone,
          'collage_id': collage_id,
        },
        headers: NetworkConfig.getHeaders(needAuth: true, extraHeaders: {}),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(RegisterModel.fromJson(commonResponse.data!['data']));
        } else {
          return Left(commonResponse.message ?? ''); //رسالة الخطأ
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
