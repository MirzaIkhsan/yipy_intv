import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yipy_intv/pages/internet_page/internet_controller.dart';
import 'package:yipy_intv/pages/internet_page/widgets/list_internet_transaction.dart';
import 'package:yipy_intv/pages/internet_page/widgets/verification_info.dart';

class TransactionsSection extends StatelessWidget {
  const TransactionsSection({super.key, required this.controller});

  final InternetController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: Colors.white,
      child: Column(
        children: [
          const VerificationInfo(),
          const SizedBox(height: 24),
          Obx(() {
            if (controller.items.value == null) return const SizedBox();
            if (controller.items.value!.isEmpty) return const SizedBox();
            return ListInternetTransactions(
              items: controller.items.value!,
              onChanged: (_) {
                controller.items.refresh();
              },
            );
          }),
        ],
      ),
    );
  }
}
