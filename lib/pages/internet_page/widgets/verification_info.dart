import 'package:flutter/material.dart';
import 'package:yipy_intv/widgets/default_bordered_container.dart';

class VerificationInfo extends StatelessWidget {
  const VerificationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBorderedContainer(
      borderRadius: BorderRadius.circular(6),
      color: const Color(0xFFFFF5E6),
      borderColor: const Color(0xFFF3CC46),
      child: Row(
        children: [
          const Icon(Icons.info_outline, size: 24, color: Color(0xFFF3CC46)),
          const SizedBox(width: 12),
          Flexible(
            child: RichText(
              text: const TextSpan(
                text:
                    'Perlu diketahui, proses verifikasi transaksi dapat memakan waktu hingga ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                ),
                children: [
                  TextSpan(
                    text: '1x24 jam.',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
