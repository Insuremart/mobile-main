import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insure_marts/controllers/appcontroller/appctrl.dart';
import 'package:insure_marts/core/api/user_api.dart';
import 'package:insure_marts/core/models/user_model.dart';
import 'package:insure_marts/core/storage/local_storage.dart';
import 'package:insure_marts/storage/session_manager.dart';
import 'package:insure_marts/ui/profile/security/change_password.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  var isChangingPassword = false.obs;
  UserApi userApi = UserApi();
  AppController appCtrl = AppController();
  TextEditingController newpass, oldpass;

  @override
  void onInit() {
    super.onInit();
    newpass = TextEditingController();
    oldpass = TextEditingController();
  }

  //GET PROFILE
  getUserDetails() async {
    try {
      isLoading(true);
      final token = SessionManager.getAuth();

      await userApi.getUserDetails(token: token).then((resp) async {
        // print(resp.toString());
        isLoading(false);
        updateUserDetails(resp);
      }, onError: (err) {
        isLoading(false);
        print("Error: $err");
      });
    } catch (exceptn) {
      isLoading(false);
      print("Exception: $exceptn");
    }
  }

  void updateUserDetails(UserModel userModel) {
    var res = UserModel();
    res.getUser(userModel);
    var appCtrl;
    appCtrl.getUserModel.value = res;
    print(appCtrl.getUserModel.value.toString());
  }

//CHANGE PASSWORD

  changePassword() async {
    try {
      isChangingPassword(true);
      // final token = SessionManager.getAuth();

      await userApi
          .changePassword(
              email: appCtrl.getUserModel.value.data.email,
              newpass: newpass.text,
              oldpass: oldpass.text)
          .then((resp) async {
        isChangingPassword(false);
        // updateUserDetails(resp);
        if (resp.success = true) {}
      }, onError: (err) {
        isChangingPassword(false);
        print("Error: $err");
      });
    } catch (exceptn) {
      isChangingPassword(false);
      print("Exception: $exceptn");
    }
  }

  //EDIT PROFILE 

}
