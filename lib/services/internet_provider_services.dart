import 'package:get/get.dart';
import 'package:yipy_intv/models/internet_provider_model.dart';
import 'package:yipy_intv/models/internet_transaction_item_model.dart';

abstract class InternetProviderServices {
  static Future<List<InternetTransactionItemModel>?>
      getAllInternetTransactions() async {
    /// Delayed 1 second to mock loading process
    await Future.delayed(1.seconds);
    return [
      InternetTransactionItemModel(
        id: 'id0',
        provider: InternetProviderModel(
          id: 0,
          name: 'Nethome',
        ),
        customerId: '1123645718921',
        price: 450000,
        dueDate: DateTime(2024, 02, 16),
        package: 'Nethome 100 Mbps',
      ),
      InternetTransactionItemModel(
        id: 'id1',
        provider: InternetProviderModel(
          id: 1,
          name: 'Biznet',
        ),
        customerId: '1123645718921',
        price: 240000,
        dueDate: DateTime(2024, 02, 20),
        package: 'Biznet 100 Mbps',
      ),
    ];
  }

  /// Return transaction id
  static Future<String?> purchaseInternetProviders(
    List<InternetTransactionItemModel> item,
  ) async {
    if (item.isEmpty) return null;

    /// Mock purchasing internet provider
    await Future.delayed(2.seconds);
    return 'BC444724669887648110';
  }
}
