import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart'
    show kIsWeb; // Añadido para detectar Web
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bcefrontend/infrastructure/models/providers/user_provider.dart';

class FormularioController extends GetxController {
  final UserProvider userProvider = Get.find<UserProvider>();

  // Variables reactivas
  var fechaNacimiento = "".obs;
  var generoSeleccionado = "".obs;
  var imagenSeleccionada = Rxn<File>();

  // NUEVO: Variables para Web (no borramos las anteriores)
  var webImage = Rxn<Uint8List>();
  var nombreArchivoWeb = "".obs;

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
        if (kIsWeb) {
          // Lógica para Web: Leemos bytes
          final bytes = await archivo.readAsBytes();
          webImage.value = bytes;
          nombreArchivoWeb.value = archivo.name;
          // Asignamos un File "falso" o nulo para no romper validaciones si existen,
          // aunque en Web lo que importa son los bytes.
        } else {
          // Lógica para Móvil (tu código original)
          imagenSeleccionada.value = File(archivo.path);
        }
      }
    } catch (e) {
      Get.snackbar("Error", "No se pudo seleccionar la imagen: $e");
    }
  }

  // Enviar todo al Backend
  Future<void> createRegisterUser() async {
    // Validación: Adaptada para Web y Móvil
    if ((kIsWeb && webImage.value == null) ||
        (!kIsWeb && imagenSeleccionada.value == null)) {
      Get.snackbar(
        "Atención",
        "Es obligatorio subir una fotografía",
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      Map<String, dynamic> datosParaEnviar = {
        'usuarioId': 1,
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

      // Nota: Tu UserProvider ahora debe aceptar bytes si es Web
      dynamic archivoAEnviar;
      if (kIsWeb) {
        archivoAEnviar = webImage.value; // Envía Uint8List
      } else {
        archivoAEnviar = imagenSeleccionada.value!; // Envía File
      }

      final response = await userProvider.postUserConImagen(
        datosParaEnviar,
        archivoAEnviar, // Ahora Dart no se quejará del tipo
      );

      Get.back();

      if (response.status.hasError) {
        throw "Servidor respondió con error ${response.statusCode}: ${response.statusText}";
      }

      Get.snackbar(
        "¡Listo!",
        "Registro guardado en Drive y Excel",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      limpiarFormulario();
    } catch (e) {
      if (Get.isDialogOpen!) Get.back();
      Get.snackbar(
        "Error",
        "No se pudo completar: $e",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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
    webImage.value = null; // Limpiar también variable Web
  }

  @override
  void onClose() {
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
    webImage.value = null;
  }
}
