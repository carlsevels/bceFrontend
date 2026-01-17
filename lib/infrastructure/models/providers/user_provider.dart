import 'dart:io'; // Importante para la clase File
import 'package:get/get.dart';
import '../user_model.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return User.fromJson(map);
      if (map is List) return map.map((item) => User.fromJson(item)).toList();
    };
    // Asegúrate de que esta IP siga siendo la de tu servidor local
    httpClient.baseUrl = 'http://192.168.1.67:3030/';

    // Es recomendable aumentar el timeout ya que subir imágenes tarda más
    httpClient.timeout = const Duration(seconds: 30);
  }

  // ... otros métodos ...

  // NUEVO MÉTODO PARA ENVIAR USUARIO CON IMAGEN
  Future<Response> postUserConImagen(
    Map<String, dynamic> data,
    File imageFile,
  ) async {
    // Creamos el FormData asegurando que el archivo sea tratado como tal
    final form = FormData({
      'email': data['email'],
      'nombre': data['nombre'],
      'apellidoPaterno': data['apellidoPaterno'],
      'apellidoMaterno': data['apellidoMaterno'],
      'curp': data['curp'],
      'fechaNacimiento': data['fechaNacimiento'],
      'genero': data['genero'],
      'numCelular': data['numCelular'],
      'escolaridad': data['escolaridad'],
      'ocupacion': data['ocupacion'],
      'calleNumero': data['calleNumero'],
      'colonia': data['colonia'],
      'municipio': data['municipio'],
      'codigoPostal': data['codigoPostal'],

      // 💡 SOLUCIÓN AQUÍ:
      // 'fotografia' debe ser EXACTAMENTE igual al nombre en upload.single('fotografia')
      'file': MultipartFile(
        imageFile,
        filename: 'registro_${DateTime.now().millisecondsSinceEpoch}.jpg',
        contentType: 'image/jpeg',
      ),
    });

    // Enviamos al backend
    return post('users?mode=createUser', form);
  }

  Future<User?> getUser(int id) async {
    final response = await get('user/$id');
    return response.body;
  }

  // Este se queda para registros que no lleven imagen
  Future<dynamic> postUser(User user) async =>
      await post('users?mode=createUser', user.toJson());
}
