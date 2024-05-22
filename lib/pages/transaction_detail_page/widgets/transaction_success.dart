import 'package:flutter/material.dart';
import 'package:yipy_intv/extension/price_ext.dart';
import 'package:yipy_intv/models/transaction_detail_model.dart';

class TransactionSuccess extends StatelessWidget {
  const TransactionSuccess({super.key, required this.item});

  final TransactionDetailModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.green, width: 2),
          ),
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            text: 'Rp ',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: item.totalFee.formatCurrency(symbol: ''),
                style: const TextStyle(fontSize: 32),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Pembayaran Berhasil',
          style: TextStyle(
            color: Colors.green,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
