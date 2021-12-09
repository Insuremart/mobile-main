import 'package:get/get.dart';
import 'package:insure_marts/controllers/appcontroller/appctrl.dart';
import 'package:insure_marts/controllers/usercontroller/usercontroller.dart';
import 'package:insure_marts/core/api/auth_api.dart';
import 'package:insure_marts/core/models/user_model.dart';
import 'package:insure_marts/core/storage/local_storage.dart';
import 'package:insure_marts/storage/session_manager.dart';
import 'package:insure_marts/util/constant/routes.dart';
import 'package:insure_marts/util/error/custom_exception.dart';

import '../../locator.dart';
import 'base_vm.dart';

class AuthViewModel extends BaseModel {
  final AuthApi _authApi = locator<AuthApi>();
  String error1;
  String error2;
  String error3;

  UserModel userModel;
  final getUserCtrl = Get.put(UserController());
  final AppController appCtrl = Get.find();

  //LOG IN

  Future<void> loginUser(Map<String, dynamic> data) async {
    setBusy(true);
    try {
      userModel = await _authApi.loginUser(data);
      SessionManager.setLoggedIn(true);
      print(userModel.data.token);
      print('token coming out ');
      SessionManager.setAuth(userModel.data.token);
      await getUserCtrl.getUserDetails();
      print(appCtrl.getUserModel.value.data.token);
      print('new token going in ');
      SessionManager.setAuth(appCtrl.getUserModel.value.data.token);
      navigate.navigateTo(HomeScreenView);
      setBusy(false);
    } on CustomException catch (e) {
      error2 = e.message;
      setBusy(false);
      showErrorDialog(e);
      notifyListeners();
      print(error2);
    }
  }

  // SIGN UP

  Future<void> createUser(Map<String, dynamic> data) async {
    setBusy(true);
    try {
      userModel = await _authApi.createUser(data);
      SessionManager.setLoggedIn(true);
      SessionManager.setAuth(userModel.data.token);
      navigate.navigateToReplacing(HomeScreenView);
      setBusy(false);
      notifyListeners();
    } on CustomException catch (e) {
      error1 = e.message;
      setBusy(false);
      showErrorDialog(e);
      notifyListeners();
      return null;
    }
  }

  Future<void> logout() async {
    AppCache.clear();
    SessionManager.clearCache();
    navigate.navigateToReplacing(SplashView);
    notifyListeners();
  }

  void showErrorDialog(CustomException e) {
    dialog.showDialog(
        title: 'Error', description: e.message, buttonTitle: 'Close');
  }
}
