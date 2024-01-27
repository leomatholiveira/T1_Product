import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:untitled1/data/prod_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'dados.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(ProdDao.tableSql);
  }, version: 1);
}


