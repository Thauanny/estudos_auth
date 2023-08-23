class Env {
  static Map<String, String> map = {
    'ENV': const String.fromEnvironment('ENV', defaultValue: "local"),
    'ENV_LAUNCH': const String.fromEnvironment('ENV_LAUNCH', defaultValue: ""),
    'BASE_URL': const String.fromEnvironment('BASE_URL', defaultValue: ""),
    'PREFIXO': const String.fromEnvironment('PREFIXO', defaultValue: ""),
  };

  static get(String key) => _load(map[key]);

  static String? _load(String? env) => env;
}
