import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yipy_intv/pages/transaction_detail_page/transaction_detail_controller.dart';

class DetailTransactionSection extends StatelessWidget {
  const DetailTransactionSection({super.key, required this.controller});

  final TransactionDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      color: Colors.white,
      child: Obx(() {
        if (controller.item.value == null) return const SizedBox();
        return Column(
          children: [
            _DetailTransactionInfoItem(
              leading: 'Provided',
              trailing: controller.item.value!.providerName,
            ),
            const SizedBox(height: 20),
            _DetailTransactionInfoItem(
              leading: 'ID Pelanggan',
              trailing: controller.item.value!.customerId,
            ),
            const SizedBox(height: 20),
            _DetailTransactionInfoItem(
              leading: 'Provided',
              trailing: controller.item.value!.package,
            ),
          ],
        );
      }),
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
