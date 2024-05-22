import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yipy_intv/models/internet_provider_model.dart';
import 'package:yipy_intv/models/internet_transaction_item_model.dart';
import 'package:yipy_intv/widgets/default_appbar.dart';
import 'package:yipy_intv/widgets/default_back_button.dart';
import 'package:yipy_intv/widgets/default_history_transaction_item.dart';
import 'package:yipy_intv/widgets/default_scaffold.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  List<InternetTransactionItemModel> items = [];

  @override
  void initState() {
    super.initState();
    items.addAll([
      InternetTransactionItemModel(
        id: '0',
        provider: InternetProviderModel(id: 0, name: 'Nethome'),
        customerId: 'customer_id',
        price: 455000,
        dueDate: DateTime(2024, 02, 15, 10, 32),
      ),
      InternetTransactionItemModel(
        id: '0',
        provider: InternetProviderModel(id: 0, name: 'Bizzcom'),
        customerId: 'customer_id',
        price: 245000,
        dueDate: DateTime(2024, 02, 14, 16, 12),
      ),
      InternetTransactionItemModel(
        id: '0',
        provider: InternetProviderModel(id: 0, name: 'Bizzcom'),
        customerId: 'customer_id',
        price: 245000,
        dueDate: DateTime(2024, 01, 16, 11, 21),
      ),
      InternetTransactionItemModel(
        id: '0',
        provider: InternetProviderModel(id: 0, name: 'Nethome'),
        customerId: 'customer_id',
        price: 455000,
        dueDate: DateTime(2024, 02, 13, 11, 21),
      ),
      InternetTransactionItemModel(
        id: '0',
        provider: InternetProviderModel(id: 0, name: 'Bizzcom'),
        customerId: 'customer_id',
        price: 455000,
        dueDate: DateTime(2024, 12, 14, 17, 45),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: const DefaultAppbar(
        title: 'Transaction History',
        leading: DefaultBackButton(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.separated(
            itemCount: items.length,
            itemBuilder: (_, index) {
              return DefaultHistoryTransactionItem(item: items[index]);
            },
            separatorBuilder: (_, index) {
              return const Divider();
            },
          )
        ],
      ),
    );
  }
}
