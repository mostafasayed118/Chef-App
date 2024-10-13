import 'package:chef_app/core/database/api/end_points.dart';

class LoginModel {
  final String message;
  final String token;
  LoginModel({required this.message, required this.token});

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      message: jsonData[APIKeys.message],
      token: jsonData[APIKeys.token],
    );
  }
}
