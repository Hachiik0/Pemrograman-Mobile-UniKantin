/// Model pesanan UniKantin.
///
/// Merepresentasikan satu pesanan makanan/minuman dari mahasiswa
/// ke tenant kantin. Digunakan sebagai kontrak data dasar pada M01.
library;

/// Status pesanan dalam siklus hidup pemesanan.
enum OrderStatus { pending, confirmed, preparing, ready, completed, cancelled }

/// Satu item dalam pesanan (nama menu + jumlah + harga satuan).
class OrderItem {
  final String menuItemId;
  final String name;
  final int quantity;
  final double unitPrice;

  const OrderItem({
    required this.menuItemId,
    required this.name,
    required this.quantity,
    required this.unitPrice,
  });

  double get subtotal => quantity * unitPrice;

  OrderItem copyWith({
    String? menuItemId,
    String? name,
    int? quantity,
    double? unitPrice,
  }) {
    return OrderItem(
      menuItemId: menuItemId ?? this.menuItemId,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderItem &&
          runtimeType == other.runtimeType &&
          menuItemId == other.menuItemId &&
          name == other.name &&
          quantity == other.quantity &&
          unitPrice == other.unitPrice;

  @override
  int get hashCode =>
      menuItemId.hashCode ^
      name.hashCode ^
      quantity.hashCode ^
      unitPrice.hashCode;

  @override
  String toString() =>
      'OrderItem(menuItemId: $menuItemId, name: $name, '
      'qty: $quantity, unitPrice: $unitPrice)';
}

/// Model utama pesanan.
class Order {
  final String id;
  final String studentId;
  final String tenantId;
  final List<OrderItem> items;
  final double totalPrice;
  final OrderStatus status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const Order({
    required this.id,
    required this.studentId,
    required this.tenantId,
    required this.items,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    this.updatedAt,
  });

  Order copyWith({
    String? id,
    String? studentId,
    String? tenantId,
    List<OrderItem>? items,
    double? totalPrice,
    OrderStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Order(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      tenantId: tenantId ?? this.tenantId,
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Order && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'Order(id: $id, student: $studentId, '
      'tenant: $tenantId, status: $status, total: $totalPrice)';
}
