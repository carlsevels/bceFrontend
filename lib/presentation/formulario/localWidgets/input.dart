import 'package:bcefrontend/presentation/formulario/controllers/formulario.controller.dart';
import 'package:bcefrontend/presentation/theme/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputPage extends GetView<FormularioController> {
  final String label;
  final IconData? icon;
  final TextInputType type;
  final TextEditingController? controllerForm;
  const InputPage({
    super.key,
    required this.label,
    this.icon,
    this.controllerForm,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: TextFormField(
        controller: controllerForm,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon, color: primaryBlue) : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}
