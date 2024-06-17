import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._interval();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._interval();

//------------------------------------------------------------------------------
// GET DATABASE INSTANCE
//------------------------------------------------------------------------------

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDataBase();

    return _database!;
  }

//------------------------------------------------------------------------------
// INIT DATABASE
//------------------------------------------------------------------------------

  Future<Database> initDataBase() async {
    final path = join(await getDatabasesPath(), 'cafe_orders.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

//------------------------------------------------------------------------------
// ON CREATE
//------------------------------------------------------------------------------

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE product_groups (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY,
        group_id INTEGER,
        name TEXT,
        FOREIGN KEY(group_id) REFERENCES product_groups(id)
      )
    ''');
    await db.execute('''
      CREATE TABLE orders (
        id INTEGER PRIMARY KEY,
        product_id INTEGER,
        created_at TEXT,
        FOREIGN KEY(product_id) REFERENCES products(id)
      )
    ''');
    await _seedDatabase(db);
  }

//------------------------------------------------------------------------------
// CLEAR DATABASE
//------------------------------------------------------------------------------

  Future<void> clearTables() async {
    final db = await database;
    await db.delete('product_groups');
    await db.delete('products');
    await db.delete('orders');
  }

//------------------------------------------------------------------------------
// QUERY ALL ROWS
//------------------------------------------------------------------------------

  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    final db = await database;
    return await db.query(table);
  }

//------------------------------------------------------------------------------
// GET PRODUCTS WITH GROUP ID
//------------------------------------------------------------------------------

  Future<List<Map<String, dynamic>>> getProductsByGroupId(int id) async {
    final db = await database;
    final maps =
        await db.query('products', where: 'group_id = ?', whereArgs: [id]);

    if (maps.isEmpty) {
      return [];
    }

    return maps;
  }

//------------------------------------------------------------------------------
// INSERT
//------------------------------------------------------------------------------

  Future<int> insert(String table, Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert(table, row);
  }

//------------------------------------------------------------------------------
// UPDATE
//------------------------------------------------------------------------------

  Future<int> update(String table, Map<String, dynamic> row) async {
    final db = await database;
    final id = row['id'];
    return await db.update(table, row, where: 'id = ?', whereArgs: [id]);
  }

//------------------------------------------------------------------------------
// DELETE
//------------------------------------------------------------------------------

  Future<int> delete(String table, int id) async {
    final db = await database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

//------------------------------------------------------------------------------
// SEED DATABASE
//------------------------------------------------------------------------------

  Future<void> _seedDatabase(Database db) async {
    //
    await db.insert('product_groups', {'id': 1, 'name': 'Drinks'});
    await db.insert('product_groups', {'id': 2, 'name': 'Meals'});

    //
    await db.insert('products', {'id': 1, 'group_id': 1, 'name': 'Coca-cola'});
    await db.insert('products', {'id': 2, 'group_id': 1, 'name': 'Fanta'});
    //
    await db.insert('products', {'id': 3, 'group_id': 2, 'name': 'Hot-dog'});
    await db.insert('products', {'id': 4, 'group_id': 2, 'name': 'Lavash'});
    await db.insert('products', {'id': 5, 'group_id': 2, 'name': 'Sandvich'});

    //
    await db.insert('orders', {
      'id': 1,
      'product_id': 1,
      'created_at': DateTime.now().toIso8601String()
    });
    await db.insert('orders', {
      'id': 2,
      'product_id': 1,
      'created_at': DateTime.now().toIso8601String()
    });
    await db.insert('orders', {
      'id': 3,
      'product_id': 3,
      'created_at': DateTime.now().toIso8601String()
    });
    await db.insert('orders', {
      'id': 4,
      'product_id': 4,
      'created_at': DateTime.now().toIso8601String()
    });
  }
}
