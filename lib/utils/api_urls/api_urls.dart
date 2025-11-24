import 'package:my_trainer/utils/config/app_config.dart';

class ApiUrls {
  static const base = AppConfig.baseURL;

  static String login() => '$base/auth/login';
}
