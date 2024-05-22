import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yipy_intv/pages/internet_page/internet_controller.dart';
import 'package:yipy_intv/pages/internet_page/sections/history_section.dart';
import 'package:yipy_intv/pages/internet_page/sections/pay_section.dart';
import 'package:yipy_intv/pages/internet_page/sections/transactions_section.dart';
import 'package:yipy_intv/widgets/default_appbar.dart';
import 'package:yipy_intv/widgets/default_back_button.dart';
import 'package:yipy_intv/widgets/default_scaffold.dart';
import 'package:yipy_intv/widgets/default_sliver_height.dart';

class InternetPage extends StatelessWidget {
  const InternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = InternetController.create;

    return DefaultScaffold(
      appBar: const DefaultAppbar(
        title: 'Internet',
        leading: DefaultBackButton(),
      ),
      body: Obx(() {
        if (controller.items.value == null) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFFE12029)),
          );
        }
        return Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TransactionsSection(controller: controller),
                ),
                const DefaultSliverHeight(gap: 6),
                SliverToBoxAdapter(
                  child: HistorySection(controller: controller),
                ),
                const DefaultSliverHeight(gap: 200),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: PaySection(controller: controller),
            ),
          ],
        );
      }),
    );
  }
}
