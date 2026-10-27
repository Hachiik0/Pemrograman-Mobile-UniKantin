import 'package:flutter_test/flutter_test.dart';
import 'package:unikantin/services/pin_service.dart';
import 'package:unikantin/services/secure_storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Mock sederhana FlutterSecureStorage menggunakan Map in-memory.
///
/// Digunakan untuk menguji PinService tanpa perangkat Android.
class FakeSecureStorage extends FlutterSecureStorage {
  final Map<String, String> _data = {};

  FakeSecureStorage() : super();

  @override
  Future<void> write({
    required String key,
    required String? value,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    if (value != null) {
      _data[key] = value;
    } else {
      _data.remove(key);
    }
  }

  @override
  Future<String?> read({
    required String key,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    return _data[key];
  }

  @override
  Future<void> delete({
    required String key,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    _data.remove(key);
  }

  @override
  Future<void> deleteAll({
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    _data.clear();
  }
}

void main() {
  late PinService pinService;

  setUp(() {
    final fakeStorage = FakeSecureStorage();
    final secureStorageService = SecureStorageService(storage: fakeStorage);
    pinService = PinService(secureStorage: secureStorageService);
  });

  group('PinService', () {
    test('setPin dan verifyPin berhasil dengan PIN valid', () async {
      await pinService.setPin('1234');
      final result = await pinService.verifyPin('1234');
      expect(result, isTrue);
    });

    test('verifyPin gagal dengan PIN salah', () async {
      await pinService.setPin('1234');
      final result = await pinService.verifyPin('9999');
      expect(result, isFalse);
    });

    test('verifyPin gagal jika PIN belum diatur', () async {
      final result = await pinService.verifyPin('1234');
      expect(result, isFalse);
    });

    test('removePin menghapus PIN', () async {
      await pinService.setPin('1234');
      await pinService.removePin();
      final result = await pinService.verifyPin('1234');
      expect(result, isFalse);
    });

    test('isPinSet mengembalikan true setelah setPin', () async {
      await pinService.setPin('5678');
      final result = await pinService.isPinSet();
      expect(result, isTrue);
    });

    test('setPin menolak PIN terlalu pendek', () async {
      expect(() => pinService.setPin('12'), throwsA(isA<ArgumentError>()));
    });

    test('setPin menolak PIN non-numerik', () async {
      expect(() => pinService.setPin('abcd'), throwsA(isA<ArgumentError>()));
    });

    test('setPin menerima PIN 4–8 digit', () async {
      await pinService.setPin('12345678');
      final result = await pinService.verifyPin('12345678');
      expect(result, isTrue);
    });
  });
}
