import 'package:yipy_intv/models/transaction_detail_model.dart';

abstract class TransactionServices {
  static Future<TransactionDetailModel?> fetchTransactionDetail(
    String id,
  ) async {
    return TransactionDetailModel(
      status: TransactionDetailStatus.success,
      providerName: 'Nethome',
      customerId: '1123645718921',
      package: 'Nethome 100 Mbps',
      transactionId: 'BC444724669887648110',
      purchasedDate: DateTime(2024, 02, 15, 10, 32),
      paymentFee: 450000,
      convenienceFee: 5000,
      paymentMethod: 'BCA Virtual Account',
    );
  }
}
