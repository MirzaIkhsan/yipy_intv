import 'package:flutter/material.dart';
import 'package:yipy_intv/extension/date_ext.dart';
import 'package:yipy_intv/extension/price_ext.dart';
import 'package:yipy_intv/models/internet_transaction_item_model.dart';
import 'package:yipy_intv/widgets/default_cached_network_image.dart';
import 'package:yipy_intv/widgets/default_checkbox.dart';
import 'package:yipy_intv/widgets/default_divider.dart';

class DefaultInternetTransactionItem extends StatefulWidget {
  const DefaultInternetTransactionItem({
    super.key,
    required this.item,
    this.onCheckItem,
  });

  final InternetTransactionItemModel item;
  final Function(bool isChecked)? onCheckItem;

  @override
  State<DefaultInternetTransactionItem> createState() =>
      _DefaultInternetTransactionItemState();
}

class _DefaultInternetTransactionItemState
    extends State<DefaultInternetTransactionItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0xFFE9E9E9)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DefaultCachedNetworkImage(width: 32, height: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.price.toIDR,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Due date on ${widget.item.dueDate.toReadableFormat}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                DefaultCheckbox(
                  value: widget.item.checked,
                  onChanged: onChangedState,
                ),
              ],
            ),
          ),
          const DefaulDivider(),
          Builder(builder: (_) {
            if (!isExpanded) return const SizedBox();
            return Column(
              children: [
                _DetailTransaction(item: widget.item),
                const DefaulDivider(),
              ],
            );
          }),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: onExpandItem,
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(40),
                foregroundColor: Colors.grey,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                ),
              ),
              child: Text(
                isExpanded ? 'Close' : 'See Detail',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFFE12029),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onExpandItem() {
    isExpanded = !isExpanded;
    setState(() {});
  }

  void onChangedState(bool? _) {
    widget.item.checked = !widget.item.checked;
    setState(() {});
    widget.onCheckItem?.call(widget.item.checked);
  }
}

class _DetailTransaction extends StatelessWidget {
  const _DetailTransaction({required this.item});

  final InternetTransactionItemModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _DetailTransactionInfoItem(
            leading: 'Provider',
            trailing: item.provider.name,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _DetailTransactionInfoItem(
            leading: 'ID Pelanggan',
            trailing: item.customerId,
          ),
        ),
        const SizedBox(height: 10),
        if (item.package != null)
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 12,
            ),
            child: _DetailTransactionInfoItem(
              leading: 'Paket Layanan',
              trailing: item.package!,
            ),
          ),
      ],
    );
  }
}

class _DetailTransactionInfoItem extends StatelessWidget {
  const _DetailTransactionInfoItem({
    required this.leading,
    required this.trailing,
  });

  final String leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leading, style: style),
        Text(trailing, style: style),
      ],
    );
  }

  TextStyle get style {
    return const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Colors.black,
    );
  }
}
