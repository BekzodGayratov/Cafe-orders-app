class Order {
  final int? id;
  final int? productId;
  final DateTime? createdAt;

  Order({required this.id, required this.productId, required this.createdAt});

//------------------------------------------------------------------------------
// FROM MAP
//------------------------------------------------------------------------------

  factory Order.fromMap(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      productId: json['product_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

//------------------------------------------------------------------------------
// TO MAP
//------------------------------------------------------------------------------

  Map<String, dynamic> toMap() =>
      {'id': id, 'product_id': productId, 'created_at': createdAt!.toIso8601String()};
}
