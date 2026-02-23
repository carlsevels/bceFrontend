import 'dart:io';
import 'package:bcefrontend/presentation/formulario/localWidgets/DatePicker.dart';
import 'package:bcefrontend/presentation/formulario/localWidgets/enviarRegistro.dart';
import 'package:bcefrontend/presentation/formulario/localWidgets/genderDropdown.dart';
import 'package:bcefrontend/presentation/formulario/localWidgets/header.dart';
import 'package:bcefrontend/presentation/formulario/localWidgets/input.dart';
import 'package:bcefrontend/presentation/formulario/localWidgets/photoPicker.dart';
import 'package:bcefrontend/presentation/formulario/localWidgets/privacidadDatos.dart';
import 'package:bcefrontend/presentation/formulario/localWidgets/tituloDeSeccion.dart';
import 'package:bcefrontend/presentation/theme/app-colors.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bcefrontend/presentation/formulario/controllers/formulario.controller.dart';

class FormularioScreen extends GetView<FormularioController> {
  const FormularioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: background,
            elevation: 0,
            pinned: true,
            centerTitle: true,
            leading: const BackButton(color: textDark),
            title: const Text(
              "Registro de Usuario",
              style: TextStyle(
                color: textDark,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 10),
                HeaderWidget(),
                const SizedBox(height: 24),
                PrivacidadDatosPage(),
                const SizedBox(height: 32),
                TituloSeccionPage(
                  title: "DATOS PERSONALES",
                  icon: Icons.person_add_alt_1_rounded,
                ),
                InputPage(
                  label: "Correo electrónico",
                  icon: Icons.alternate_email_rounded,
                  type: TextInputType.emailAddress,
                  controllerForm: controller.emailController,
                ),
                const SizedBox(height: 16),
                InputPage(
                  type: TextInputType.text,
                  label: "Nombre(s)",
                  icon: Icons.badge_outlined,
                  controllerForm: controller.nombreController,
                ),
                const SizedBox(height: 16),
                InputPage(
                  type: TextInputType.text,
                  label: "Apellido Paterno",
                  controllerForm: controller.apellidoPaternoController,
                ),
                const SizedBox(height: 16),
                InputPage(
                  type: TextInputType.text,
                  label: "Apellido Materno",
                  controllerForm: controller.apellidoMaternoController,
                ),
                const SizedBox(height: 16),
                InputPage(
                  type: TextInputType.text,
                  label: "CURP",
                  icon: Icons.fingerprint_rounded,
                  controllerForm: controller.curpController,
                ),
                const SizedBox(height: 16),
                DatePickerPage(),
                const SizedBox(height: 16),
                GenderDropdownPage(),
                const SizedBox(height: 32),
                TituloSeccionPage(
                  title: "CONTACTO Y UBICACIÓN",
                  icon: Icons.location_on_rounded,
                ),
                InputPage(
                  label: "Número de celular",
                  icon: Icons.phone_iphone_rounded,
                  type: TextInputType.phone,
                  controllerForm: controller.numCelularController,
                ),
                const SizedBox(height: 16),
                InputPage(
                  type: TextInputType.text,
                  label: "Calle y número",
                  icon: Icons.home_rounded,
                  controllerForm: controller.calleNumeroController,
                ),
                const SizedBox(height: 16),
                InputPage(
                  label: "Colonia",
                  type: TextInputType.text,
                  controllerForm: controller.coloniaController,
                ),
                const SizedBox(height: 16),
                InputPage(
                  label: "Municipio",
                  type: TextInputType.text,
                  controllerForm: controller.municipioController,
                ),
                const SizedBox(height: 16),
                InputPage(
                  label: "Código Postal",
                  type: TextInputType.number,
                  controllerForm: controller.codigoPostalController,
                ),
                const SizedBox(height: 16),
                InputPage(
                  type: TextInputType.text,
                  label: "Escolaridad",
                  controllerForm: controller.escolaridadController,
                ),
                const SizedBox(height: 16),
                InputPage(
                  type: TextInputType.text,
                  label: "Ocupacion",
                  controllerForm: controller.ocupacionController,
                ),
                const SizedBox(height: 32),
                TituloSeccionPage(
                  title: "DOCUMENTACIÓN",
                  icon: Icons.upload_file_rounded,
                ),
                PhotoPickerPage(),
                const SizedBox(height: 40),
                EnviarRegistroPage(),
                const SizedBox(height: 60),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
