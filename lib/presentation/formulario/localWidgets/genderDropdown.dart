import 'package:bcefrontend/presentation/formulario/controllers/formulario.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderDropdownPage extends GetView<FormularioController> {
  const GenderDropdownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Obx(
        () => DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            value: controller.generoSeleccionado.value.isEmpty
                ? null
                : controller.generoSeleccionado.value,
            hint: const Text("Género"),
            items: ["Masculino", "Femenino", "Otro"]
                .map((val) => DropdownMenuItem(value: val, child: Text(val)))
                .toList(),
            onChanged: (val) => controller.generoSeleccionado.value = val!,
          ),
        ),
      ),
    );
  }
}
