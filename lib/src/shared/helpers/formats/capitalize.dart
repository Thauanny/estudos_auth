extension CapitalizeExtension on String {
  String capitalize() {
    if (trim().isEmpty) return '';

    return split(' ')
        .map((e) => "${e[0].toUpperCase()}${e.substring(1).toLowerCase()}")
        .join(" ");
  }
}
