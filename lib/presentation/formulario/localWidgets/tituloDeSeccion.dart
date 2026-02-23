import 'package:bcefrontend/presentation/formulario/controllers/formulario.controller.dart';
import 'package:bcefrontend/presentation/theme/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TituloSeccionPage extends GetView<FormularioController> {
  final String title;
  final IconData? icon;

  const TituloSeccionPage({super.key, this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon ?? Icons.question_mark, size: 18, color: primaryBlue),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: textLight,
          ),
        ),
      ],
    );
  }
}
