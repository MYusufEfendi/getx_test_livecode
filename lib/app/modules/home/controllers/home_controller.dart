import 'package:get/get.dart';
import 'package:test_live_code/app/data/models/users_model.dart';

import '../../../service/dio_services.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  var isLoading = false.obs;
  var isError = "".obs;
  var usersResponse = UsersModel(
    support: null,
    data: [],
    page: null,
    perPage: null,
    total: null,
    totalPages: null,
  ).obs;

  var service = Get.put((DioClient()));

  getUsers() async {
    try {

      var res = await service.getUsers();
      usersResponse.value = res!;
    } catch (e) {
      print("error  $e");
      isLoading.value = false;
      isError.value = e.toString();
    }
  }
}
