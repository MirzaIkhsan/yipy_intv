import 'package:flutter/material.dart';
import 'package:yipy_intv/extension/list_internet_transaction_ext.dart';
import 'package:yipy_intv/extension/list_widget_ext.dart';
import 'package:yipy_intv/models/internet_transaction_item_model.dart';
import 'package:yipy_intv/widgets/default_checkbox.dart';
import 'package:yipy_intv/widgets/default_internet_transaction_item.dart';

class ListInternetTransactions extends StatefulWidget {
  const ListInternetTransactions({
    super.key,
    required this.items,
    this.onChanged,
  });

  final List<InternetTransactionItemModel> items;
  final Function(List<InternetTransactionItemModel> items)? onChanged;

  @override
  State<ListInternetTransactions> createState() =>
      _ListInternetTransactionsState();
}

class _ListInternetTransactionsState extends State<ListInternetTransactions> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) return const SizedBox();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Choose All',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            DefaultCheckbox(value: state, onChanged: onCheckAllItem),
          ],
        ),
        const SizedBox(height: 16),
        ...widget.items
            .map((item) {
              return DefaultInternetTransactionItem(
                item: item,
                onCheckItem: onCheckItem,
              );
            })
            .toList()
            .addSpaceVertically(16),
      ],
    );
  }

  void onCheckItem(bool _) {
    if (widget.items.isAllChecked) {
      state = true;
    } else {
      state = false;
    }
    setState(() {});
    widget.onChanged?.call(widget.items);
  }

  void onCheckAllItem(bool? _) {
    state = !state;
    if (state) {
      widget.items.checkAllItem();
    } else {
      widget.items.uncheckAllItem();
    }
    setState(() {});
    widget.onChanged?.call(widget.items);
  }
}
