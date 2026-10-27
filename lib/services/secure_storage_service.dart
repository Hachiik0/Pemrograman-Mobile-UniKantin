/// Layanan penyimpanan aman menggunakan flutter_secure_storage.
///
/// Menyediakan operasi baca/tulis/hapus untuk data sensitif
/// yang perlu disimpan secara terenkripsi di perangkat.
///
/// Pada M01, digunakan untuk menyimpan hash PIN lokal dan salt.
/// Bukan pengganti autentikasi server.
library;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Service penyimpanan aman untuk data sensitif UniKantin.
class SecureStorageService {
  final FlutterSecureStorage _storage;

  /// Membuat instance dengan konfigurasi default yang aman.
  SecureStorageService({FlutterSecureStorage? storage})
    : _storage =
          storage ??
          const FlutterSecureStorage(
            aOptions: AndroidOptions(encryptedSharedPreferences: true),
          );

  // --- Kunci penyimpanan ---
  static const String _pinHashKey = 'unikantin_pin_hash';
  static const String _pinSaltKey = 'unikantin_pin_salt';
  static const String _pinEnabledKey = 'unikantin_pin_enabled';

  /// Menulis nilai sensitif.
  Future<void> write({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  /// Membaca nilai sensitif. Mengembalikan `null` jika tidak ada.
  Future<String?> read({required String key}) async {
    return _storage.read(key: key);
  }

  /// Menghapus nilai berdasarkan kunci.
  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }

  /// Menghapus seluruh data yang dikelola service ini.
  Future<void> deleteAll() async {
    await _storage.delete(key: _pinHashKey);
    await _storage.delete(key: _pinSaltKey);
    await _storage.delete(key: _pinEnabledKey);
  }

  // --- Operasi khusus PIN ---

  /// Menyimpan hash PIN.
  Future<void> savePinHash(String hash) async {
    await write(key: _pinHashKey, value: hash);
  }

  /// Membaca hash PIN.
  Future<String?> getPinHash() async {
    return read(key: _pinHashKey);
  }

  /// Menyimpan salt PIN.
  Future<void> savePinSalt(String salt) async {
    await write(key: _pinSaltKey, value: salt);
  }

  /// Membaca salt PIN.
  Future<String?> getPinSalt() async {
    return read(key: _pinSaltKey);
  }

  /// Menyimpan status aktivasi PIN.
  Future<void> setPinEnabled(bool enabled) async {
    await write(key: _pinEnabledKey, value: enabled.toString());
  }

  /// Membaca status aktivasi PIN.
  Future<bool> isPinEnabled() async {
    final value = await read(key: _pinEnabledKey);
    return value == 'true';
  }
}
