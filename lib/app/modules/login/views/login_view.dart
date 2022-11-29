import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text('LoginView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                textAlignVertical: TextAlignVertical.bottom,
                controller: controller.emailC,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  errorText: controller.emailErr.value.isEmpty
                      ? null
                      : controller.emailErr.value,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  hintText: "Masukkan Email",
                  prefixText: '',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                textAlignVertical: TextAlignVertical.bottom,
                controller: controller.passC,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  errorText: controller.emailErr.value.isEmpty
                      ? null
                      : controller.emailErr.value,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  hintText: "Masukkan Password",
                  prefixText: '',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.postLogin();
                },
                child: const SizedBox(
                    width: 100,
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                    )),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () {

                },
                child: const SizedBox(
                    width: 100,
                    child: Text(
                      "Register",
                      textAlign: TextAlign.center,
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
