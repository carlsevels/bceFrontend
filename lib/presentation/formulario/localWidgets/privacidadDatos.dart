import 'package:bcefrontend/presentation/formulario/controllers/formulario.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacidadDatosPage extends GetView<FormularioController> {
  const PrivacidadDatosPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: ListTile(
        leading: const Icon(Icons.shield_outlined, color: Colors.green),
        title: const Text(
          "Privacidad de Datos",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
        onTap: () => _mostrarAvisoPrivacidad(),
      ),
    );
  }
}
  void _mostrarAvisoPrivacidad() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Aviso de Privacidad",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Text(
              "Sus datos están protegidos por la Biblioteca Central del Estado.",
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text("ENTENDIDO"),
            ),
          ],
        ),
      ),
    );
  }
