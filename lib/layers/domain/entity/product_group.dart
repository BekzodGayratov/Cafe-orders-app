class ProductGroup {
  final int? id;
  final String? name;

  ProductGroup({required this.id, required this.name});

//------------------------------------------------------------------------------
// FROM MAP
//------------------------------------------------------------------------------

  factory ProductGroup.fromMap(Map<String, dynamic> json) {
    return ProductGroup(
      id: json['id'],
      name: json['name'],
    );
  }

//------------------------------------------------------------------------------
// TO MAP
//------------------------------------------------------------------------------

  Map<String, dynamic> toMap() =>
      {'id': id, 'name': name};
}
