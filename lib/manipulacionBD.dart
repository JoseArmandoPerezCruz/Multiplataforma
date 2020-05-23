
import 'package:proyect/definicionBD.dart';
import 'package:proyect/usuario.dart';
import 'package:sqflite/sqflite.dart';

var validado=0;


//Esta clase toma la conexión creada en la clase de DefinicionBD para insertar y recuperar datos
class ManipulacionBD {

  final dbProvider = DefinicionBD.dbProvider;
  usuario usu = new usuario();

  void cargarDatos(String nick, String pasword) async {

    var user = usuario(nombre_usuario: nick,
        contrasena: pasword);

    //Inserta registros a la tabla
    await insertVuelo(user);
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  }

  Future<void> insertVuelo(usuario user) async {
    final db = await dbProvider.database;
    // Inserta un vueo en la tabla correspondiente. También prevee
    // la repetición de registros `conflictAlgorithm`, reemplazandolos
    await db.insert(
      'usuarios',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  int valida(String nick, String contrasena){
    getUsuario(nick,contrasena);
    return validado;
    Future.delayed(const Duration(milliseconds: 500), () {

// Here you can write your code

    });
  }

  Future<void> getUsuario(String nick, String contrasena) async {
    final db = await dbProvider.database;

    final List<Map<String, dynamic>> maps = await db.query('usuarios');
    var ciclos = maps.length;
    var user;
    var contra;
    validado=0;
    print(maps);
    print(ciclos);

    for (var i = 0; i < ciclos; i++) {
      user = maps[i]['nombre_usuario'];
      contra = maps[i]['contrasena'];
      if(nick==user){validado++;}
      if(contrasena==contra){validado++;}
    }
    print(validado);
    //return maps.map((map) => usuario.fromMap(map)).toList();
    // Convierte  List<Map<String, dynamic>  a List<Dog>.
    /*return List.generate(maps.length, (i) {
      return usuario(
        id: maps[i]['id'],
        nombre_usuario: maps[i]['nombre_usuario'],
        contrasena: maps[i]['contrasena']
      );
    });*/
    return validado;
  }
  /*void imprimir() async{
    print("imprimi esto");
    print(await getUsuarios());
  }*/
}