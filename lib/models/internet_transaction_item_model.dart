import 'package:yipy_intv/models/internet_provider_model.dart';

class InternetTransactionItemModel {
  InternetTransactionItemModel({
    required this.id,
    required this.provider,
    required this.customerId,
    required this.price,
    required this.dueDate,
    this.image,
    this.package,
    this.checked = false,
  });

  final String id;
  final InternetProviderModel provider;
  final String customerId;
  final String? package;
  final String? image;
  final int price;
  final DateTime dueDate;

  bool checked;
}
