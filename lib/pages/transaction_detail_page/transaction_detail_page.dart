import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yipy_intv/pages/transaction_detail_page/sections/detail_transaction_section.dart';
import 'package:yipy_intv/pages/transaction_detail_page/sections/payment_transaction_section.dart';
import 'package:yipy_intv/pages/transaction_detail_page/sections/status_payment_section.dart';
import 'package:yipy_intv/pages/transaction_detail_page/transaction_detail_controller.dart';
import 'package:yipy_intv/widgets/default_appbar.dart';
import 'package:yipy_intv/widgets/default_back_button.dart';
import 'package:yipy_intv/widgets/default_scaffold.dart';
import 'package:yipy_intv/widgets/default_sliver_height.dart';

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final controller = TransactionDetailController.create(id);

    return DefaultScaffold(
      appBar: const DefaultAppbar(
        title: 'Transaction Details',
        leading: DefaultBackButton(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Obx(() {
              if (controller.item.value == null) return const SizedBox();
              return StatusPaymentSection(controller: controller);
            }),
          ),
          const DefaultSliverHeight(gap: 8),
          SliverToBoxAdapter(
            child: Obx(() {
              if (controller.item.value == null) return const SizedBox();
              return DetailTransactionSection(controller: controller);
            }),
          ),
          const DefaultSliverHeight(gap: 8),
          SliverToBoxAdapter(
            child: Obx(() {
              if (controller.item.value == null) return const SizedBox();
              return PaymentTransactionSection(controller: controller);
            }),
          ),
          const DefaultSliverHeight(gap: 20),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Proses verifikasi transaksi dapat memakan waktu hingga 1x24 jam.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF838799),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
