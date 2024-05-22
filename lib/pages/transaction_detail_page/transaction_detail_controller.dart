import 'package:get/get.dart';
import 'package:yipy_intv/models/transaction_detail_model.dart';
import 'package:yipy_intv/services/transaction_services.dart';

class TransactionDetailController extends GetxController {
  static TransactionDetailController create(String id) {
    _id = id;
    if (Get.isRegistered<TransactionDetailController>()) {
      return Get.find<TransactionDetailController>();
    }
    return Get.put(TransactionDetailController());
  }

  static late String _id;

  @override
  void onInit() {
    super.onInit();
    fetchTransactionDetail();
  }

  Rx<TransactionDetailModel?> item = Rx(null);

  Future<void> fetchTransactionDetail() async {
    item.value = await TransactionServices.fetchTransactionDetail(_id);
  }
}
