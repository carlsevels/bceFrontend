import 'package:bcefrontend/presentation/formulario/controllers/formulario.controller.dart';
import 'package:bcefrontend/presentation/theme/app-colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPickerPage extends GetView<FormularioController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final tieneFoto = kIsWeb
          ? controller.webImage.value != null
          : controller.imagenSeleccionada.value != null;
      return GestureDetector(
        onTap: () => !tieneFoto
            ? controller.seleccionarImagen(ImageSource.gallery)
            : _mostrarImagenCompleta(),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFCBD5E1)),
          ),
          child: !tieneFoto
              ? const Center(
                  child: Icon(
                    Icons.add_a_photo_rounded,
                    size: 48,
                    color: primaryBlue,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      kIsWeb
                          ? Image.memory(
                              controller.webImage.value!,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              controller.imagenSeleccionada.value!,
                              fit: BoxFit.cover,
                            ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.black54,
                          child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: controller.eliminarImagen,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      );
    });
  }

  void _mostrarImagenCompleta() {
    Get.to(
      () => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const CloseButton(color: Colors.white),
        ),
        body: Center(
          child: kIsWeb
              ? Image.memory(controller.webImage.value!)
              : Image.file(controller.imagenSeleccionada.value!),
        ),
      ),
    );
  }
}
