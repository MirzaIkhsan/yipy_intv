import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yipy_intv/models/internet_transaction_item_model.dart';
import 'package:yipy_intv/pages/transaction_detail_page/transaction_detail_page.dart';
import 'package:yipy_intv/services/internet_provider_services.dart';

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

  Future<void> onPay() async {
    if (items.value == null) return;
    if (items.value!.isEmpty) return;

    final checkedItems = items.value!.where((item) => item.checked).toList();
    if (checkedItems.isEmpty) return;

    String? transactionId;

    await Get.showOverlay(
      asyncFunction: () async {
        transactionId =
            await InternetProviderServices.purchaseInternetProviders(
          checkedItems,
        );

        return false;
      },
      loadingWidget: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(child: CircularProgressIndicator(color: Colors.red)),
      ),
    );

    if (transactionId == null) {
      Get.snackbar(
        'Pembayaran gagal',
        'Terjadi kegagalan saat melakukan pembayaran, silakan coba lagi sesaat',
      );
      return;
    }

    Get.to(() => TransactionDetailPage(id: transactionId!));
  }
}
