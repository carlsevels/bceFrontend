import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bcefrontend/infrastructure/models/providers/user_provider.dart';
import 'package:bcefrontend/infrastructure/models/user_model.dart';

class FormularioController extends GetxController {
  final UserProvider userProvider = Get.find<UserProvider>();

  // Variables reactivas
  var fechaNacimiento = "".obs;
  var generoSeleccionado = "".obs;
  var imagenSeleccionada = Rxn<File>();
  
  final ImagePicker _picker = ImagePicker();

  // Controladores de los campos de texto
  final emailController = TextEditingController();
  final nombreController = TextEditingController();
  final apellidoPaternoController = TextEditingController();
  final apellidoMaternoController = TextEditingController();
  final curpController = TextEditingController();
  final fechaNacimientoController = TextEditingController();
  final numCelularController = TextEditingController();
  final calleNumeroController = TextEditingController();
  final coloniaController = TextEditingController();
  final municipioController = TextEditingController();
  final codigoPostalController = TextEditingController();
  final ocupacionController = TextEditingController();
  final escolaridadController = TextEditingController();

  // Seleccionar la foto desde la cámara o galería
  Future<void> seleccionarImagen(ImageSource source) async {
    try {
      final XFile? archivo = await _picker.pickImage(
        source: source,
        maxWidth: 1080,
        imageQuality: 85,
      );

      if (archivo != null) {
        imagenSeleccionada.value = File(archivo.path);
      }
    } catch (e) {
      Get.snackbar("Error", "No se pudo seleccionar la imagen: $e");
    }
  }

  // Enviar todo al Backend
  Future<void> createRegisterUser() async {
    // Validación: Sin foto no hay registro
    if (imagenSeleccionada.value == null) {
      Get.snackbar("Atención", "Es obligatorio subir una fotografía",
          backgroundColor: Colors.orange, colorText: Colors.white);
      return;
    }

    try {
      // Mostrar pantalla de carga
      Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);

      // Preparamos el mapa de textos
      Map<String, dynamic> datosParaEnviar = {
        'email': emailController.text.trim(),
        'nombre': nombreController.text.trim(),
        'apellidoPaterno': apellidoPaternoController.text.trim(),
        'apellidoMaterno': apellidoMaternoController.text.trim(),
        'curp': curpController.text.trim(),
        'fechaNacimiento': fechaNacimiento.value,
        'genero': generoSeleccionado.value,
        'numCelular': numCelularController.text.trim(),
        'escolaridad': escolaridadController.text.trim(),
        'ocupacion': ocupacionController.text.trim(),
        'calleNumero': calleNumeroController.text.trim(),
        'colonia': coloniaController.text.trim(),
        'municipio': municipioController.text.trim(),
        'codigoPostal': codigoPostalController.text.trim(),
      };

      // LLAMADA AL PROVIDER: Pasamos los textos y el archivo File
      final response = await userProvider.postUserConImagen(
        datosParaEnviar,
        imagenSeleccionada.value!,
      );

      Get.back(); // Quitar el loading

      if (response.status.hasError) {
        throw "Servidor respondió con error ${response.statusCode}: ${response.statusText}";
      }

      // ÉXITO TOTAL
      Get.snackbar("¡Listo!", "Registro guardado en Drive y Excel",
          backgroundColor: Colors.green, colorText: Colors.white);

      limpiarFormulario();

    } catch (e) {
      if (Get.isDialogOpen!) Get.back();
      Get.snackbar("Error", "No se pudo completar: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
      debugPrint("❌ Error en registro: $e");
    }
  }

  void limpiarFormulario() {
    emailController.clear();
    nombreController.clear();
    apellidoPaternoController.clear();
    apellidoMaternoController.clear();
    curpController.clear();
    fechaNacimientoController.clear();
    numCelularController.clear();
    calleNumeroController.clear();
    coloniaController.clear();
    municipioController.clear();
    codigoPostalController.clear();
    ocupacionController.clear();
    escolaridadController.clear();
    fechaNacimiento.value = "";
    generoSeleccionado.value = "";
    imagenSeleccionada.value = null;
  }

  @override
  void onClose() {
    // Es vital hacer dispose para no saturar la memoria del celular
    emailController.dispose();
    nombreController.dispose();
    apellidoPaternoController.dispose();
    apellidoMaternoController.dispose();
    curpController.dispose();
    fechaNacimientoController.dispose();
    numCelularController.dispose();
    calleNumeroController.dispose();
    coloniaController.dispose();
    municipioController.dispose();
    codigoPostalController.dispose();
    ocupacionController.dispose();
    escolaridadController.dispose();
    super.onClose();
  }
    void eliminarImagen() {
    imagenSeleccionada.value = null;
  }
}