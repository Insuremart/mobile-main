class PartnerApi {
      // Future changePassword({token, email,oldpass, newpass}) async {
  //   Map<String, String> requestHeaders = {
  //     "Content-Type": "application/json",
  //   //  HttpHeaders.authorizationHeader: "Bearer $token",
  //   };
  //   var _map = <String, dynamic>{};
  //   _map["email"] = email;
  //   _map["old"] = oldpass;
  //   _map["new"] = newpass;
  //   try {
  //     final response = await http.post(Uri.parse(AppConfig.post_changePassword),
  //         body: jsonEncode(_map), headers: requestHeaders);
  //     debugPrint(AppConfig.post_changePassword);
  //     debugPrint(response.statusCode.toString());
  //     debugPrint(response.body);
  //     if (response.statusCode == 200) {
  //       return SuccessModel.fromJson(response.body);
  //     } else if (response.statusCode == 400 || response.statusCode == 401) {
  //       return ErrorModel.fromJson(response.body);
  //     } else {
  //       return response.body;
  //     }
  //   } catch (exception) {
  //     return Future.error(exception.toString());
  //   }
  // }
}
