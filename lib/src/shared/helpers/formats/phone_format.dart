String phoneFormat(String value) => value.replaceAllMapped(
      RegExp(r'(\d{2})(\d{5})(\d+)'),
      (Match m) => '(${m[1]}) ${m[2]}-${m[3]}',
    );
