import 'package:bcefrontend/presentation/formulario/controllers/formulario.controller.dart';
import 'package:bcefrontend/presentation/theme/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnviarRegistroPage extends GetView<FormularioController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () => controller.createRegisterUser(),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: const Text(
          "ENVIAR REGISTRO",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
