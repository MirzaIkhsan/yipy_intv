import 'package:flutter/material.dart';
import 'package:yipy_intv/extension/date_ext.dart';
import 'package:yipy_intv/extension/price_ext.dart';
import 'package:yipy_intv/models/internet_transaction_item_model.dart';
import 'package:yipy_intv/widgets/default_cached_network_image.dart';

class DefaultHistoryTransactionItem extends StatelessWidget {
  const DefaultHistoryTransactionItem({
    super.key,
    required this.item,
    this.onCheckItem,
  });

  final InternetTransactionItemModel item;
  final Function(bool isChecked)? onCheckItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DefaultCachedNetworkImage(width: 32, height: 32),
            const SizedBox(width: 12),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.provider.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Builder(builder: (_) {
                        final purchasedDatetime = item.dueDate;
                        final date =
                            purchasedDatetime.toReadableAbbrevationFormat;
                        final time = purchasedDatetime.formatTimeWithoutSecond;
                        final combined = '$date $time';
                        return Text(
                          combined,
                          style: const TextStyle(
                            color: Color(0xFF838799),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      }),
                    ],
                  ),
                  Text(
                    item.price.toIDR,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
