import 'dart:io';
import 'package:flutter_app/model/model_client.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqlite_api.dart';

class ClientDatabaseProvider {
  ClientDatabaseProvider._();

  static final ClientDatabaseProvider db = ClientDatabaseProvider._();
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstanace();
    return _database;
  }

  Future<Database> getDatabaseInstanace() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "client.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Client ("
          "id integer primary key,"
          "name TEXT,"
          "phone TEXT"
          ")");
    });
  }

  //Query get semuadata

  Future<List<Client>> getAllClients() async {
    final db = await database;
    var response = await db?.query("Client");
    List<Client> list = response!.map((c) => Client.fromMap(c)).toList();
    return list;
  }

  //Query get data perid
  Future<Client?> getClientWithId(int id) async {
    final db = await database;
    var response = await db?.query("Client", where: "id = ?", whereArgs: [id]);
    return response!.isNotEmpty ? Client.fromMap(response.first) : null;
  }

  //Insert
  addClientToDatabase(Client client) async {
    final db = await database;
    var table = await db?.rawQuery("SELECT MAX(id)+1 as id FROM Client");
    int id = table?.first["id"] as int;
    client.id = id;
    var raw = await db?.insert(
      "Client",
      client.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return raw;
  }

  //Delete
  //Delete client with id
  deleteClientWithId(int? id) async {
    final db = await database;
    return db?.delete("Client", where: "id = ?", whereArgs: [id]);
  }

  //Delete all clients
  deleteAllClient() async {
    final db = await database;
    db?.delete("Client");
  }

  //Update
  updateClient(Client client) async {
    final db = await database;
    var response = await db?.update("Client", client.toMap(),
        where: "id = ?", whereArgs: [client.id]);
    return response;
  }
}
