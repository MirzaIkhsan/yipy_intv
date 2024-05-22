import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yipy_intv/pages/internet_page/internet_controller.dart';
import 'package:yipy_intv/pages/transaction_history_page/transaction_history_page.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({super.key, required this.controller});

  final InternetController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onRedirect,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        width: double.infinity,
        color: Colors.white,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transaction History',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }

  void onRedirect() {
    Get.to(() => const TransactionHistoryPage());
  }
}
