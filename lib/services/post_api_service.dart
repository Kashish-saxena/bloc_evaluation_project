import 'dart:developer';

import 'package:bloc_project/models/signup_request_model.dart';
import 'package:http/http.dart' as http;

class PostApiService {
  static Future<bool> postData(SignUpRequestModel signUpRequestModel) async {
    try {
      final response = await http.post(Uri.parse("https://gorest.co.in/public/v2/users"),
          body: signUpRequestModelToJson(signUpRequestModel),
          headers: {
            "Authorization":
                "Bearer 4886dfcfd3d0dd22cba3a9d2d0aac01a0c43e93259141dc48ba45a5c56f7272b"
          });
      if (response.statusCode == 201) {
        log("Request data is: ${response.body}");
        return true;
      } else {
        return false;
      }
    } catch (e, s) {
      log("Exception :: $e :: StackTrace :: $s");
      return false;
    }
  }
}
