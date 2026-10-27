/// Kontrak repository pesanan UniKantin.
///
/// Mendefinisikan operasi CRUD yang harus disediakan oleh
/// setiap implementasi repository pesanan (in-memory, Firestore, dll).
library;

import '../models/order.dart';

/// Interface repository pesanan.
///
/// Adaptasi dari pola ExpenseRepository pada slide dosen,
/// disesuaikan untuk domain pemesanan makanan UniKantin.
abstract class OrderRepository {
  /// Mengambil seluruh pesanan.
  Future<List<Order>> getAll();

  /// Mengambil pesanan berdasarkan [id].
  /// Mengembalikan `null` jika tidak ditemukan.
  Future<Order?> getById(String id);

  /// Menambahkan pesanan baru.
  Future<void> add(Order order);

  /// Memperbarui pesanan yang sudah ada berdasarkan ID.
  Future<void> update(Order order);

  /// Menghapus pesanan berdasarkan [id].
  Future<void> deleteById(String id);

  /// Menghapus seluruh pesanan.
  /// Hanya untuk keperluan pengujian dan reset data pengembangan.
  Future<void> deleteAll();
}
