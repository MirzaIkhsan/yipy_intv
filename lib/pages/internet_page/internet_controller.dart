import 'package:get/get.dart';
import 'package:yipy_intv/models/internet_transaction_item_model.dart';
import 'package:yipy_intv/services/internet_provider_service.dart';

class InternetController extends GetxController {
  static InternetController get create {
    if (Get.isRegistered<InternetController>()) {
      return Get.find<InternetController>();
    }
    return Get.put(InternetController());
  }

  Rx<List<InternetTransactionItemModel>?> items = Rx(null);

  @override
  void onInit() {
    super.onInit();
    fetchInternetProviders();
  }

  Future<void> fetchInternetProviders() async {
    items.value = await InternetProviderServices.getAllInternetTransactions();
  }
}
