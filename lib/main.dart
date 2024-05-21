import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yipy_intv/pages/internet_page/internet_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Yipy Interview - Moh Mirza Maulana Ikhsan',
      theme: ThemeData(useMaterial3: false),
      home: const InternetPage(),
    );
  }
}
