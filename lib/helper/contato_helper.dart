import 'package:app_aula/model/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContatoHelper {
  static final ContatoHelper _instance = ContatoHelper.internal();
  factory ContatoHelper() => _instance;
  ContatoHelper.internal();
  late Database _db;

  Future<Database> initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'contato_base.db');

    return await openDatabase(path, onCreate: (Database db, int newVers) async {
      await db.execute(
          "CREATE TABLE contato(_id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, email TEXT, celular TEXT)");
    }, version: 1);
  }

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<List<Contato>> obterTodos() async {
    Database dbContact = await db;
    List listMap = await dbContact.rawQuery("SELECT * FROM contato");
    List<Contato> listContact = [];
    for (Map m in listMap) {
      Contato c = Contato.fromMap(m.cast<String, dynamic>());
      listContact.add(c);
    }
    return listContact;
  }

  Future<Contato> inserir(Contato obj) async {
    Database dbContact = await initDb();

    obj.id = dbContact.insert('contato', obj.toMap()).toString();
    return obj;
  }

  Future<int> excluir(Contato obj) async {
    Database dbContact = await db;
    return await dbContact
        .delete('contato', where: "_id = ?", whereArgs: [obj.id]);
  }

  Future<int> alterar(Contato obj) async {
    Database dbContact = await db;
    return await dbContact
        .update('contato', obj.toMap(), where: "_id = ?", whereArgs: [obj.id]);
  }

  // Future<Contato> getObjeto(String idFind) async {
  //   Database dbContact = await db;
  //   List<Map> maps = await dbContact.query(contactTable,
  //       columns: [idCol, nomeCol], where: "$idCol = ?", whereArgs: [idFind]);
  //   if (maps.length > 0) {
  //     return Contato.fromMap(maps.first);
  //   } else {
  //     return null;
  //   }
  // }

  // Future<int> getNumber() async {
  //   Database dbContact = await db;
  //   return Sqflite.firstIntValue(
  //       await dbContact.rawQuery("SELECT COUNT(*) FROM $contactTable"));
  // }

  Future close() async {
    Database dbContact = await db;
    dbContact.close();
  }
}
