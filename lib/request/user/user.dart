// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:e_fu/request/api.dart';
import 'login_data.dart';

import 'package:e_fu/request/data.dart';

abstract class UserAPI {
  //註冊會員
  // Future<String> createUser();

  /// 登入
  Future<Format> login(String user, String psw);

  
}

class UserRepo extends API implements UserAPI {
  @override
  Future<Format> login(String user, String psw) async {
    try {
      final response = await client.post(Uri.parse('$domain/login'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(User(id: user, password: psw).toJson()));

      Map responseBody = json.decode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        logger.v(response.body);
        return Format.fromJson(responseBody);
      } else {
        logger.v("not 200");
        return Format.fromJson(responseBody);
      }
    } catch (e) {
      logger.v("error");
      logger.v(e.toString());
      return Format.fromFields("error", false, "");
    }
  }

  
  }

