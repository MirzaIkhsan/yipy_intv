extension DateExt on DateTime {
  String get toReadableFormat {
    final months = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    return '$day ${months[month - 1]} $year';
  }
}