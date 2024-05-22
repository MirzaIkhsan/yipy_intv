import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yipy_intv/extension/date_ext.dart';
import 'package:yipy_intv/extension/price_ext.dart';
import 'package:yipy_intv/pages/transaction_detail_page/transaction_detail_controller.dart';

class PaymentTransactionSection extends StatelessWidget {
  const PaymentTransactionSection({super.key, required this.controller});

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
              leading: 'No. Transaksi',
              trailing: controller.item.value!.transactionId,
            ),
            const SizedBox(height: 20),
            Builder(builder: (_) {
              final purchasedDatetime = controller.item.value!.purchasedDate;
              final date = purchasedDatetime.toReadableAbbrevationFormat;
              final time = purchasedDatetime.formatTimeWithoutSecond;
              final combined = '$date $time';
              return _DetailTransactionInfoItem(
                leading: 'Waktu Transaksi',
                trailing: combined,
              );
            }),
            const SizedBox(height: 20),
            _DetailTransactionInfoItem(
              leading: 'Jumlah Tagihan',
              trailing: controller.item.value!.paymentFee.toIDR,
            ),
            const SizedBox(height: 20),
            _DetailTransactionInfoItem(
              leading: 'Convenience Fee',
              trailing: controller.item.value!.convenienceFee.toIDR,
            ),
            const SizedBox(height: 20),
            _DetailTransactionInfoItem(
              leading: 'Payment Method',
              trailing: controller.item.value!.paymentMethod,
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
