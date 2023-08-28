import 'package:flutter_templete/core/data/network/network_config.dart';

class CollegeEndpoints {
  static String getAll = NetworkConfig.getFullApiRoute('all-collage');
  static String getMecdicalCollages =
      NetworkConfig.getFullApiRoute('medical-collage');
  static String getEngCollages = NetworkConfig.getFullApiRoute('eng-collage');
  static String collegeSubjects = NetworkConfig.getFullApiRoute('collages/');
}
