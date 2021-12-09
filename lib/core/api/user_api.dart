import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:insure_marts/core/models/successmodel.dart';
import 'package:insure_marts/core/models/user_model.dart';
import 'package:insure_marts/util/constant/appconfig.dart';
import 'package:insure_marts/util/error/error_model.dart';

class UserApi {
  Future getUserDetails({var token}) async {
    Map<String, String> requestHeaders = {
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json",
    };
    try {
      final response =
          await http.get(Uri.parse(AppConfig.get_me), headers: requestHeaders);
      print(AppConfig.get_me);
      print(response.statusCode.toString());
      print(response.body);
      if (response.statusCode == 200) {
        //  print("is this where you are coming from");
        return userModelFromJson(response.body);
      } else {
        return response.body;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

    Future changePassword({token, email,oldpass, newpass}) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
    //  HttpHeaders.authorizationHeader: "Bearer $token",
    };
    var _map = <String, dynamic>{};
    _map["email"] = email;
    _map["old"] = oldpass;
    _map["new"] = newpass;
    try {
      final response = await http.post(Uri.parse(AppConfig.post_changePassword),
          body: jsonEncode(_map), headers: requestHeaders);
      debugPrint(AppConfig.post_changePassword);
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
      if (response.statusCode == 200) {
        return SuccessModel.fromJson(response.body);
      } else if (response.statusCode == 400 || response.statusCode == 401) {
        return ErrorModel.fromJson(response.body);
      } else {
        return response.body;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
