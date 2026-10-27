/// Implementasi in-memory dari [OrderRepository].
///
/// Digunakan pada M01 untuk fondasi dan pengujian tanpa
/// ketergantungan pada backend Firestore.
library;

import '../models/order.dart';
import 'order_repository.dart';

/// Repository pesanan berbasis memori.
///
/// Data disimpan dalam `Map` dan hilang saat aplikasi ditutup.
/// Cocok untuk pengembangan lokal dan pengujian unit.
class InMemoryOrderRepository implements OrderRepository {
  final Map<String, Order> _store = {};

  @override
  Future<List<Order>> getAll() async {
    return List.unmodifiable(_store.values.toList());
  }

  @override
  Future<Order?> getById(String id) async {
    return _store[id];
  }

  @override
  Future<void> add(Order order) async {
    _store[order.id] = order;
  }

  @override
  Future<void> update(Order order) async {
    if (!_store.containsKey(order.id)) {
      throw ArgumentError('Order dengan id ${order.id} tidak ditemukan.');
    }
    _store[order.id] = order;
  }

  @override
  Future<void> deleteById(String id) async {
    _store.remove(id);
  }

  @override
  Future<void> deleteAll() async {
    _store.clear();
  }
}
