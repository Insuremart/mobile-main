import 'dart:io';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter/material.dart';

class AuthController extends GetxController {
  var imeiString = ''.obs;
  var cPermissionStatus = PermissionStatus.denied.obs;
  var permissionStatus = PermissionStatus.denied.obs;
  var locPermissionStatus = PermissionStatus.denied.obs;
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  var lat = 0.0.obs;
  var lng = 0.0.obs;
  var geolocator = Geolocator();

  void listenForPermissionStatus(Permission permission) async {
    final status = await permission.status;

    // if (permission == Permission.location) {
    //   locPermissionStatus.value = status;
    //   if (locPermissionStatus.value.isGranted) {
    //     getLocation();
    //   }
    // } else if (permission == Permission.contacts) {
    //   cPermissionStatus.value = status;
    //   if (cPermissionStatus.value.isGranted) {
    //     getContacts();
    //   }
    // } else {
    permissionStatus.value = status;
    // }
  }

  @override
  void onInit() {
    super.onInit();

    listenForPermissionStatus(Permission.location);
    initPlatformState();
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();

    print(status.toString());
    if (permission == Permission.location) {
      locPermissionStatus.value = status;
      if (locPermissionStatus.value.isGranted) {
        getLocation();
      }
    }
    // else if (permission == Permission.contacts) {
    //   cPermissionStatus.value = status;
    //   if (cPermissionStatus.value.isGranted) {
    //     getContacts();
    //   }
    // }
    else {
      permissionStatus.value = status;
    }
    print(permissionStatus.string);
  }

  getLocation() async {
    print('statement');
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
        forceAndroidLocationManager: true);
    lat.value = position.latitude;
    lng.value = position.longitude;

    print(lat.value.toString());
    print(lng.value.toString());
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Future<void> initPlatformState() async {
    Map<String, dynamic> deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        print(deviceData['id'].toString());
        imeiString = deviceData['id'];
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        print(deviceData['model']);
        imeiString = deviceData['model'];
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    // if (!mounted) {
    //   return;
    // }

    // imeiString = deviceData[''];
  }
}
