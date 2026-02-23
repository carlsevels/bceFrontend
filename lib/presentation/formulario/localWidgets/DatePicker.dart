import 'package:bcefrontend/presentation/formulario/controllers/formulario.controller.dart';
import 'package:bcefrontend/presentation/theme/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerPage extends GetView<FormularioController> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime(2000),
          firstDate: DateTime(1920),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          controller.fechaNacimiento.value =
              "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
        }
      },
      child: Container(
        height: 58,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_month_rounded, color: primaryBlue),
            const SizedBox(width: 12),
            Obx(
              () => Text(
                controller.fechaNacimiento.value.isEmpty
                    ? "Fecha de Nacimiento"
                    : controller.fechaNacimiento.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
