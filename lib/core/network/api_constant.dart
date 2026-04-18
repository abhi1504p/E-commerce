import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstant {

  static  String baseUrl = dotenv.env['BASE_URL'] ?? '';

  // endpoints
  static const String register = "/users/register";
  static const String login = "/login";
}