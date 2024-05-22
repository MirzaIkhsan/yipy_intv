enum TransactionDetailStatus { success, failed }

class TransactionDetailModel {
  TransactionDetailModel({
    required this.status,
    required this.providerName,
    required this.customerId,
    required this.package,
    required this.transactionId,
    required this.purchasedDate,
    required this.paymentFee,
    required this.convenienceFee,
    required this.paymentMethod,
  });

  final TransactionDetailStatus status;
  final String providerName;
  final String customerId;
  final String package;
  final String transactionId;
  final DateTime purchasedDate;
  final int paymentFee;
  final int convenienceFee;
  final String paymentMethod;

  int get totalFee => paymentFee + convenienceFee;
}
