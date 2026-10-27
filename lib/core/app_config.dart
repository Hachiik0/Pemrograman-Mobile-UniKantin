/// Konfigurasi lingkungan aplikasi UniKantin.
///
/// Nilai diatur melalui `--dart-define` saat build.
/// Default menggunakan nilai aman untuk pengembangan lokal.
///
/// Catatan keamanan: Jangan masukkan secret (API key, password)
/// melalui `--dart-define` karena nilainya dapat tertanam di APK.
library;

class AppConfig {
  AppConfig._();

  /// Lingkungan saat ini: 'development', 'staging', atau 'production'.
  static const String env = String.fromEnvironment(
    'ENV',
    defaultValue: 'development',
  );

  /// Apakah menggunakan backend remote (Firestore).
  /// Default `false` pada M01 — hanya menggunakan in-memory.
  static const bool useRemote = bool.fromEnvironment(
    'USE_REMOTE',
    defaultValue: false,
  );

  /// `true` jika lingkungan adalah production.
  static bool get isProd => env == 'production';

  /// `true` jika lingkungan adalah development.
  static bool get isDev => env == 'development';

  /// Nama aplikasi.
  static const String appName = 'UniKantin';

  /// Versi aplikasi saat ini.
  static const String appVersion = '1.0.0';
}
