import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  // Cosntrutor com acesso privado, para criar apenas uma instância

  DB._();

  // Criando uma isntância estática
  static final DB instance = DB._();

  static Database? _database;

  get database async {
    if (_database != null) {
      return _database;
    }
    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'cripto.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    await db.execute(_account);
    await db.execute(_wallet);
    await db.execute(_history);
    await db.execute('account', {'balance': 0});
  }

  String get _account => '''
  CREATE TABLE conte (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    balance REAL
  )
''';

  String get _wallet => '''
  CREATE TABLE carteira (
    acronym TEXT PRIMARY KEY,
    currency TEXT,
    quantity TEXT
  )
''';

  String get _history => '''
  CREATE TABLE conte (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    operation_date INT,
    type_of_operation TEXT,
    currency TEXT,
    acronym TEXT,
    value REAL,
    quantity TEXT
  )
''';
}
