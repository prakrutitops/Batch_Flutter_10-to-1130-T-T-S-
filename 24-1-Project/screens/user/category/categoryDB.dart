//@dart=2.9

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'categoryDBModel.dart';

class DB{
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path,"MYDatabase.db"),onCreate: (database,version)async
    {
      await database.execute('CREATE TABLE CategoryDownload(id INTEGER PRIMARY KEY AUTOINCREMENT,url TEXT NOT NULL)');
    },version: 1);
  }

  Future<bool> insertData(CategoryModel categoryModel) async {
    final Database db = await initDB();
    db.insert("CategoryDownload", categoryModel.toMap());
    return true;
  }

  Future<List<CategoryModel>> getData() async {
    final Database db = await initDB();
    final List<Map<String,Object>> data = await db.query("CategoryDownload");
    return data.map((e) => CategoryModel.formMap(e)).toList();
  }

  Future<void> deleteData(int id) async {
    final Database db = await initDB();
    await db.delete("CategoryDownload",where: "id=?",whereArgs: [id]);
  }
}