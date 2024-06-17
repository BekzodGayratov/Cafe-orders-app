class Product {
  final int? id;
  final int? groupId;
  final String? name;

  Product({required this.id, required this.groupId, required this.name});

//------------------------------------------------------------------------------
// FROM MAP
//------------------------------------------------------------------------------

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      groupId: json['group_id'],
      name: json['name'],
    );
  }

//------------------------------------------------------------------------------
// TO MAP
//------------------------------------------------------------------------------

  Map<String, dynamic> toMap() =>
      {'id': id, 'group_id': id, 'name': name};
}
