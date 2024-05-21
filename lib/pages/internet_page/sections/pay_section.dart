import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yipy_intv/extension/list_internet_transaction_ext.dart';
import 'package:yipy_intv/extension/price_ext.dart';
import 'package:yipy_intv/pages/internet_page/internet_controller.dart';

class PaySection extends StatelessWidget {
  const PaySection({super.key, required this.controller});

  final InternetController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: kToolbarHeight,
      ),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.receipt_long, color: Colors.red),
              const SizedBox(width: 12),
              const Text(
                'Total Payment',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Obx(() {
                if (controller.items.value == null) {
                  return const SizedBox();
                }
                return Text(
                  controller.items.value!.totalPrice.toIDR,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF244091),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: Obx(() {
              if (controller.items.value == null) {
                return const SizedBox();
              }
              if (controller.items.value!.isEmpty) {
                return const SizedBox();
              }
              return TextButton(
                onPressed: controller.items.value!.isThereAnyCheckedItem
                    ? () {}
                    : null,
                style: TextButton.styleFrom(
                  backgroundColor: controller.items.value!.isThereAnyCheckedItem
                      ? const Color(0xFFE12029)
                      : Colors.grey[350],
                  foregroundColor: Colors.grey,
                ),
                child: const Text(
                  'PAY NOW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
