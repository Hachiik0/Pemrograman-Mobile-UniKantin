import 'package:flutter_test/flutter_test.dart';
import 'package:unikantin/models/order.dart';
import 'package:unikantin/repositories/in_memory_order_repository.dart';

void main() {
  late InMemoryOrderRepository repository;

  final testOrder = Order(
    id: 'order-001',
    studentId: 'mhs-001',
    tenantId: 'tenant-001',
    items: const [
      OrderItem(
        menuItemId: 'menu-001',
        name: 'Nasi Goreng',
        quantity: 1,
        unitPrice: 15000,
      ),
      OrderItem(
        menuItemId: 'menu-002',
        name: 'Es Teh',
        quantity: 2,
        unitPrice: 5000,
      ),
    ],
    totalPrice: 25000,
    status: OrderStatus.pending,
    createdAt: DateTime(2026, 10, 27),
  );

  setUp(() {
    repository = InMemoryOrderRepository();
  });

  group('InMemoryOrderRepository', () {
    test('getAll mengembalikan list kosong saat awal', () async {
      final orders = await repository.getAll();
      expect(orders, isEmpty);
    });

    test('add dan getAll bekerja dengan benar', () async {
      await repository.add(testOrder);
      final orders = await repository.getAll();
      expect(orders.length, 1);
      expect(orders.first.id, 'order-001');
    });

    test('getById mengembalikan order yang benar', () async {
      await repository.add(testOrder);
      final found = await repository.getById('order-001');
      expect(found, isNotNull);
      expect(found!.studentId, 'mhs-001');
      expect(found.tenantId, 'tenant-001');
      expect(found.totalPrice, 25000);
    });

    test('getById mengembalikan null untuk ID tidak ditemukan', () async {
      final found = await repository.getById('tidak-ada');
      expect(found, isNull);
    });

    test('update mengubah data order', () async {
      await repository.add(testOrder);
      final updated = testOrder.copyWith(status: OrderStatus.confirmed);
      await repository.update(updated);
      final found = await repository.getById('order-001');
      expect(found!.status, OrderStatus.confirmed);
    });

    test('update melempar error untuk order tidak ditemukan', () async {
      expect(() => repository.update(testOrder), throwsA(isA<ArgumentError>()));
    });

    test('deleteById menghapus order', () async {
      await repository.add(testOrder);
      await repository.deleteById('order-001');
      final found = await repository.getById('order-001');
      expect(found, isNull);
    });

    test('deleteAll menghapus semua order', () async {
      await repository.add(testOrder);
      final order2 = testOrder.copyWith(id: 'order-002');
      await repository.add(order2);
      await repository.deleteAll();
      final orders = await repository.getAll();
      expect(orders, isEmpty);
    });
  });

  group('OrderItem', () {
    test('subtotal dihitung dengan benar', () {
      const item = OrderItem(
        menuItemId: 'menu-001',
        name: 'Nasi Goreng',
        quantity: 3,
        unitPrice: 15000,
      );
      expect(item.subtotal, 45000);
    });

    test('equality bekerja berdasarkan semua field', () {
      const item1 = OrderItem(
        menuItemId: 'menu-001',
        name: 'Nasi Goreng',
        quantity: 1,
        unitPrice: 15000,
      );
      const item2 = OrderItem(
        menuItemId: 'menu-001',
        name: 'Nasi Goreng',
        quantity: 1,
        unitPrice: 15000,
      );
      expect(item1, equals(item2));
    });
  });

  group('Order', () {
    test('equality berdasarkan ID', () {
      final order2 = testOrder.copyWith(totalPrice: 99999);
      expect(testOrder, equals(order2));
    });

    test('copyWith menghasilkan salinan dengan perubahan', () {
      final updated = testOrder.copyWith(
        status: OrderStatus.completed,
        totalPrice: 30000,
      );
      expect(updated.status, OrderStatus.completed);
      expect(updated.totalPrice, 30000);
      expect(updated.id, testOrder.id);
    });
  });
}
