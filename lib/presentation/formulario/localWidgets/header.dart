import 'package:bcefrontend/presentation/formulario/controllers/formulario.controller.dart';
import 'package:bcefrontend/presentation/theme/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWidget extends GetView<FormularioController> {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "BIBLIOTECA CENTRAL DEL ESTADO",
          style: TextStyle(
            color: primaryBlue.withOpacity(0.8),
            fontWeight: FontWeight.w800,
            fontSize: 12,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Fray Servando\nTeresa de Mier",
          style: TextStyle(
            color: textDark,
            fontSize: 32,
            fontWeight: FontWeight.w900,
            height: 1.1,
          ),
        ),
      ],
    );
  }
}
