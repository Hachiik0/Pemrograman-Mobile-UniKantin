/// Layanan PIN lokal UniKantin.
///
/// Menggunakan PBKDF2 dengan HMAC-SHA256 untuk hashing PIN.
/// Salt acak kriptografis, 120.000 iterasi, output 256-bit.
///
/// Catatan keamanan:
/// - PIN lokal ini bukan pengganti autentikasi akun mahasiswa.
/// - PIN tidak disimpan dalam plaintext.
/// - Perbandingan hash menggunakan waktu konstan.
library;

import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

import 'secure_storage_service.dart';

/// Service untuk mengelola PIN lokal aplikasi.
class PinService {
  final SecureStorageService secureStorage;

  /// Jumlah iterasi PBKDF2 sesuai panduan M01.
  static const int _iterations = 120000;

  /// Panjang output hash dalam byte (256 bit).
  static const int _hashLength = 32;

  /// Panjang salt dalam byte.
  static const int _saltLength = 32;

  /// Panjang PIN yang diizinkan.
  static const int pinMinLength = 4;
  static const int pinMaxLength = 8;

  PinService({required this.secureStorage});

  /// Mengatur PIN baru.
  ///
  /// Memvalidasi format PIN, menghasilkan salt acak,
  /// menghitung hash PBKDF2, dan menyimpan keduanya secara aman.
  Future<void> setPin(String pin) async {
    _validatePin(pin);

    final salt = _generateSalt();
    final hash = await _hashPin(pin, salt);

    final saltBase64 = base64Encode(salt);
    final hashBase64 = base64Encode(hash);

    await secureStorage.savePinSalt(saltBase64);
    await secureStorage.savePinHash(hashBase64);
    await secureStorage.setPinEnabled(true);
  }

  /// Memverifikasi PIN yang dimasukkan pengguna.
  ///
  /// Mengembalikan `true` jika PIN cocok.
  /// Menggunakan perbandingan waktu konstan.
  Future<bool> verifyPin(String pin) async {
    final storedHashBase64 = await secureStorage.getPinHash();
    final storedSaltBase64 = await secureStorage.getPinSalt();

    if (storedHashBase64 == null || storedSaltBase64 == null) {
      return false;
    }

    final salt = base64Decode(storedSaltBase64);
    final inputHash = await _hashPin(pin, salt);
    final storedHash = base64Decode(storedHashBase64);

    return _constantTimeEquals(inputHash, storedHash);
  }

  /// Menghapus PIN dan menonaktifkan fitur.
  Future<void> removePin() async {
    await secureStorage.deleteAll();
  }

  /// Memeriksa apakah PIN sudah diatur.
  Future<bool> isPinSet() async {
    return secureStorage.isPinEnabled();
  }

  /// Validasi format PIN.
  void _validatePin(String pin) {
    if (pin.length < pinMinLength || pin.length > pinMaxLength) {
      throw ArgumentError(
        'PIN harus terdiri dari $pinMinLength–$pinMaxLength digit.',
      );
    }
    if (!RegExp(r'^\d+$').hasMatch(pin)) {
      throw ArgumentError('PIN hanya boleh berisi angka.');
    }
  }

  /// Menghasilkan salt acak kriptografis.
  Uint8List _generateSalt() {
    final random = SecretKeyData.random(length: _saltLength);
    return Uint8List.fromList(random.bytes);
  }

  /// Menghitung hash PBKDF2-HMAC-SHA256.
  Future<Uint8List> _hashPin(String pin, Uint8List salt) async {
    final pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha256(),
      iterations: _iterations,
      bits: _hashLength * 8,
    );

    final secretKey = SecretKey(utf8.encode(pin));
    final nonce = salt;

    final derivedKey = await pbkdf2.deriveKey(
      secretKey: secretKey,
      nonce: nonce,
    );

    final bytes = await derivedKey.extractBytes();
    return Uint8List.fromList(bytes);
  }

  /// Perbandingan byte dengan waktu konstan untuk mencegah timing attack.
  bool _constantTimeEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    int result = 0;
    for (int i = 0; i < a.length; i++) {
      result |= a[i] ^ b[i];
    }
    return result == 0;
  }
}
