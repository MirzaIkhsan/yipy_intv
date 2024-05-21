import 'package:yipy_intv/models/internet_transaction_item_model.dart';

extension ListInternetTransactionExt on List<InternetTransactionItemModel> {
  int get totalPrice => fold(0, (sum, element) {
        if (!element.checked) return sum;
        return sum + element.price;
      });

  bool get isAllChecked => !any((element) => !element.checked);

  bool get isThereAnyCheckedItem => any((element) => element.checked);

  List<InternetTransactionItemModel> checkAllItem() {
    return map((item) {
      item.checked = true;
      return item;
    }).toList();
  }

  List<InternetTransactionItemModel> uncheckAllItem() {
    return map((item) {
      item.checked = false;
      return item;
    }).toList();
  }
}
