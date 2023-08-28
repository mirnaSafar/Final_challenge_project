import 'package:flutter_templete/core/data/network/network_config.dart';

class UserEndpoints {
  static String login = NetworkConfig.getFullApiRoute('login');
  static String register = NetworkConfig.getFullApiRoute('register');
}
