import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yipy_intv/pages/transaction_detail_page/transaction_detail_controller.dart';
import 'package:yipy_intv/pages/transaction_detail_page/widgets/transaction_success.dart';

class StatusPaymentSection extends StatelessWidget {
  const StatusPaymentSection({super.key, required this.controller});

  final TransactionDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      width: double.infinity,
      color: Colors.white,
      child: Obx(() {
        if (controller.item.value == null) return const SizedBox();
        return TransactionSuccess(item: controller.item.value!);
      }),
    );
  }
}
