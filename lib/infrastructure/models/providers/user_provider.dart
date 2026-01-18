import 'dart:io'; // Importante para la clase File
import 'package:bcefrontend/config.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../user_model.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return User.fromJson(map);
      if (map is List) return map.map((item) => User.fromJson(item)).toList();
    };
    httpClient.baseUrl = ConfigEnvironments.getEnvironments()["url"];

    httpClient.timeout = const Duration(seconds: 30);
  }


Future<Response> postUserConImagen(
    Map<String, dynamic> data,
    dynamic imageFile,
  ) async {
    
    // Preparamos los campos del formulario
    final Map<String, dynamic> formFields = {
      'usuarioId': data['usuarioId'],
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
    };

    // 2. Lógica híbrida para el archivo
    if (kIsWeb) {
      // En Web, 'imageFile' es un Uint8List (bytes)
      formFields['file'] = MultipartFile(
        imageFile, 
        filename: 'registro_${DateTime.now().millisecondsSinceEpoch}.jpg',
        contentType: 'image/jpeg',
      );
    } else {
      // En Móvil, 'imageFile' es un objeto File. Usamos .path
      formFields['file'] = MultipartFile(
        (imageFile as File).path, 
        filename: 'registro_${DateTime.now().millisecondsSinceEpoch}.jpg',
        contentType: 'image/jpeg',
      );
    }

    final form = FormData(formFields);

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
