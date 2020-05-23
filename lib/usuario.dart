
class usuario{
  int id;
  String nombre_usuario;
  String contrasena;

  usuario({this.id,this.nombre_usuario, this.contrasena});

  Map<String, dynamic> toMap() {
    return {
      'nombre_usuario': nombre_usuario,
      'contrasena': contrasena
    };
  }

  factory usuario.fromJson(Map<String, dynamic> json) {
    return usuario(
        nombre_usuario: json['nombre_usuario'],
        contrasena: json['contrasena']

    );
  }

  usuario.fromMap(Map<String, dynamic> map){
    id = map['id'];
    nombre_usuario = map['nombre_usuario'];
    contrasena = map['contrasena'];
  }

}