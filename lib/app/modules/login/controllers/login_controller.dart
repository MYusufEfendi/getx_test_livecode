import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_live_code/app/data/models/login_model.dart';
import 'package:test_live_code/app/routes/app_pages.dart';

import '../../../service/dio_services.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  var emailC = TextEditingController();
  var passC = TextEditingController();

  var emailErr = "".obs;
  var passErr = "".obs;

  bool checkField() {
    var count = 0;
    if (emailC.text.isEmpty) {
      emailErr.value = "Form Tidak boleh kososng";
      count++;
    } else if (!GetUtils.isEmail(emailC.text)) {
      emailErr.value = "Emaill tidak valid";
      count++;
    } else {
      emailErr.value = "";
    }

    if (passC.text.isEmpty) {
      passErr.value = "Form Tidak boleh kososng";
      ;
      count++;
    } else {
      passErr.value = "";
    }
    return count == 0;
  }

  var isLoading = false.obs;
  var isError = "".obs;
  var loginResult = LoginModel(token: '').obs;

  var service = Get.put((DioClient()));

  postLogin() async {
    try {
      var res = await service.postLogin(emailC.text, passC.text);
      if (res!.token.toString() != "") {
        Get.toNamed(Routes.HOME);
      }
    } catch (e) {
      print("error  $e");
      isLoading.value = false;
      isError.value = e.toString();
    }
  }
}
