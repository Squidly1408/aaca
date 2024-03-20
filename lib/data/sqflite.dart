import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE apps(
      id INTERGER PRIMARY KEY AUTOINCREMENT NOT FULL,
      text TEXT,
      icon INTERGER,
      individual BOOL,
      bgcolour INTERGER,
      mncolour INTERGER,
      txtcolour INTERGER,
    )
""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'appsdatabase.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createApp(
    int? id,
    String text,
    int icon,
    bool individual,
    int bgColour,
    int mnColour,
    int txtColour,
  ) async {
    final db = await SQLHelper.db();
    final data = {
      'text': text,
      'icon': icon,
      'individual': individual,
      'bgcolour': bgColour,
      'mncolour': mnColour,
      'txtcolour': txtColour
    };
    final id = await db.insert('apps', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('apps', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('apps', where: 'id = ?', whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
    int? id,
    String text,
    int icon,
    bool individual,
    int bgColour,
    int mnColour,
    int txtColour,
  ) async {
    final db = await SQLHelper.db();
    final data = {
      'text': text,
      'icon': icon,
      'individual': individual,
      'bgcolour': bgColour,
      'mncolour': mnColour,
      'txtcolour': txtColour
    };
    final result =
        await db.update('apps', data, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('apps', where: 'id = ?', whereArgs: [id]);
    } catch (err) {
      debugPrint('something went worng when detecting an item : $err');
    }
  }
}
