import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormularioController extends GetxController {
  //TODO: Implement FormularioController

  var fechaNacimiento = "".obs;
  var generoSeleccionado = "".obs;
  var rutaImagen = "".obs; // Guardará la ruta de la foto seleccionada

  // Simulación de selección de imagen (puedes usar image_picker aquí)
  void seleccionarImagenMock() {
    // Aquí normalmente iría la lógica de ImagePicker.
    // Por ahora simularemos una ruta para ver el diseño:
    // rutaImagen.value = "ruta/al/archivo.jpg"; 
    Get.snackbar(
      "Cámara/Galería", 
      "Aquí se integraría el plugin image_picker",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
    );
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
