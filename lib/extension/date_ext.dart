extension DateExt on DateTime {
  String get toReadableFormat {
    final months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];
    return '$day ${months[month - 1]} $year';
  }

  String get toReadableAbbrevationFormat {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Ags',
      'Sep',
      'Okt',
      'Nov',
      'Des'
    ];
    return '$day ${months[month - 1]} $year';
  }

  String get formatTimeWithoutSecond {
    return '$hour:$minute';
  }
}
