import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static const version = 1;
  static const databaseName = 'singleton_flutter';

  Database? _db;
  static Connection? _instance;

  Connection._();

  static Connection get instance {
    _instance ??= Connection._();
    return _instance!;
  }

  Future<Database> get db => _openDatabaseConnection();

  Future<Database> _openDatabaseConnection() async {
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, databaseName);

    _db ??= _db = await openDatabase(
      path,
      version: version,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
    return _db!;
  }

  FutureOr<void> _onCreate(Database db, int version) {
    db.execute('create table teste(nome varchar(200))');
    db.execute('insert into teste values("Lucas Carlos")');
    db.execute('insert into teste values("Larissa Carlos")');
    db.execute('insert into teste values("Nicolas Carlos")');
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {}

  Future<void> closeConnection() async {
    await _db!.close();
    _db = null;
  }

  // Metodos Helpers 
}
