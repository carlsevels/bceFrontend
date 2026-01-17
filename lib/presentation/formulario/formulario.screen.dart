import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// Cambia esta ruta por la real de tu proyecto
import 'package:bcefrontend/presentation/formulario/controllers/formulario.controller.dart';

class FormularioScreen extends GetView<FormularioController> {
  const FormularioScreen({Key? key}) : super(key: key);

  // Paleta de colores profesional
  static const Color primaryBlue = Color(0xFF2563EB);
  static const Color background = Color(0xFFF8FAFC);
  static const Color textDark = Color(0xFF0F172A);
  static const Color textLight = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // AppBar corregido para evitar amontonamiento con la flecha
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
                _buildHeader(),
                const SizedBox(height: 24),

                _buildPrivacidadDeDatos(),
                const SizedBox(height: 32),

                _buildSectionTitle(
                  "DATOS PERSONALES",
                  Icons.person_add_alt_1_rounded,
                ),
                _modernInput(
                  label: "Correo electrónico",
                  icon: Icons.alternate_email_rounded,
                  type: TextInputType.emailAddress,
                  controller: controller.emailController,
                ),
                const SizedBox(height: 16),
                _modernInput(
                  label: "Nombre(s)",
                  icon: Icons.badge_outlined,
                  controller: controller.nombreController,
                ),
                const SizedBox(height: 16),
                _modernInput(
                  label: "Apellido Paterno",
                  controller: controller.apellidoPaternoController,
                ),
                const SizedBox(height: 16),
                _modernInput(
                  label: "Apellido Materno",
                  controller: controller.apellidoMaternoController,
                ),
                const SizedBox(height: 16),
                _modernInput(
                  label: "CURP",
                  icon: Icons.fingerprint_rounded,
                  controller: controller.curpController,
                ),
                const SizedBox(height: 16),
                _buildDatePicker(context),
                const SizedBox(height: 16),
                _buildGenderDropdown(),

                const SizedBox(height: 32),
                _buildSectionTitle(
                  "CONTACTO Y UBICACIÓN",
                  Icons.location_on_rounded,
                ),
                _modernInput(
                  label: "Número de celular",
                  icon: Icons.phone_iphone_rounded,
                  type: TextInputType.phone,
                  controller: controller.numCelularController,
                ),
                const SizedBox(height: 16),
                _modernInput(
                  label: "Calle y número",
                  icon: Icons.home_rounded,
                  controller: controller.calleNumeroController,
                ),
                const SizedBox(height: 16),
                _modernInput(
                  label: "Colonia",
                  controller: controller.coloniaController,
                ),
                const SizedBox(height: 16),
                _modernInput(
                  label: "Municipio",
                  controller: controller.municipioController,
                ),
                const SizedBox(height: 16),
                _modernInput(
                  label: "Código Postal",
                  type: TextInputType.number,
                  controller: controller.codigoPostalController,
                ),
                const SizedBox(height: 16),
                _modernInput(
                  label: "Escolaridad",
                  controller: controller.escolaridadController,
                ),
                const SizedBox(height: 16),
                _modernInput(
                  label: "Ocupacion",
                  controller: controller.ocupacionController,
                ),
                const SizedBox(height: 32),
                _buildSectionTitle("DOCUMENTACIÓN", Icons.upload_file_rounded),
                _buildPhotoPicker(),

                const SizedBox(height: 40),
                _buildSubmitButton(),
                const SizedBox(height: 60),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
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

  Widget _buildPrivacidadDeDatos() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(Get.context!).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green[50],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shield_outlined,
              color: Colors.green[600],
              size: 20,
            ),
          ),
          title: const Text(
            "Privacidad de Datos",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: textDark,
            ),
          ),
          subtitle: Text(
            "Haz clic para ver el aviso legal",
            style: TextStyle(fontSize: 12, color: textLight),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14,
            color: textLight,
          ),
          onTap: () {
            Get.bottomSheet(
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Handle superior para cerrar
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Row(
                        children: [
                          Icon(Icons.gpp_good_rounded, color: Colors.green),
                          SizedBox(width: 12),
                          Text(
                            "Aviso de Privacidad",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: textDark,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "La Biblioteca Central del Estado 'Fray Servando Teresa de Mier', está comprometida con la protección de sus datos personales, al ser responsable de su uso, manejo y confidencialidad mediante la continua revisión de nuestros procesos de protección de datos de manera física como electrónica.",
                        style: TextStyle(
                          color: textLight,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Los datos personales que le son recabados serán utilizados para la operación de los Servicios Bibliotecarios solicitados por usted, que nos permite brindarle una mejor atención.",
                        style: TextStyle(
                          color: textLight,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Get.back(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            "ENTENDIDO",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: primaryBlue),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: textLight,
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _modernInput({
    required String label,
    IconData? icon,
    TextInputType type = TextInputType.text,
    TextEditingController? controller,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: textLight, fontSize: 14),
          prefixIcon: icon != null
              ? Icon(icon, color: primaryBlue, size: 20)
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
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
              "${picked.year}-${picked.month}-${picked.day}";
        }
      },
      child: Container(
        height: 58,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_month_rounded,
              color: primaryBlue,
              size: 20,
            ),
            const SizedBox(width: 12),
            Obx(
              () => Text(
                controller.fechaNacimiento.value.isEmpty
                    ? "Fecha de Nacimiento"
                    : controller.fechaNacimiento.value,
                style: TextStyle(
                  color: controller.fechaNacimiento.value.isEmpty
                      ? textLight
                      : textDark,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Obx(
        () => DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: const Text(
              "Género",
              style: TextStyle(color: textLight, fontSize: 14),
            ),
            value: controller.generoSeleccionado.value.isEmpty
                ? null
                : controller.generoSeleccionado.value,
            items: ["Masculino", "Femenino", "Otro", "Prefiero no decir"]
                .map(
                  (val) => DropdownMenuItem(
                    value: val,
                    child: Text(val, style: const TextStyle(fontSize: 15)),
                  ),
                )
                .toList(),
            onChanged: (val) => controller.generoSeleccionado.value = val!,
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoPicker() {
    return Obx(() {
      final image = controller.imagenSeleccionada.value;
      return GestureDetector(
        onTap: () => image == null
            ? controller.seleccionarImagen(ImageSource.gallery)
            : _mostrarImagenCompleta(image),
        child: Hero(
          tag: 'preview_foto_id',
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: const Color(0xFFCBD5E1),
                width: 2,
                style: image == null ? BorderStyle.solid : BorderStyle.none,
              ),
            ),
            child: image == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_a_photo_rounded,
                        size: 48,
                        color: primaryBlue.withOpacity(0.5),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Tocar para subir identificación",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textLight,
                        ),
                      ),
                    ],
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(image, fit: BoxFit.cover),
                        Positioned(
                          top: 12,
                          right: 12,
                          child: CircleAvatar(
                            backgroundColor: Colors.black54,
                            radius: 18,
                            child: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 16,
                              ),
                              onPressed: controller.eliminarImagen,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      );
    });
  }

  void _mostrarImagenCompleta(File image) {
    Get.to(
      () => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const CloseButton(color: Colors.white),
        ),
        body: Center(
          child: Hero(
            tag: 'preview_foto_id',
            child: InteractiveViewer(
              child: Image.file(image, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
      transition: Transition.fade,
    );
  }

  Widget _buildSubmitButton() {
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
          elevation: 0,
        ),
        child: const Text(
          "ENVIAR REGISTRO",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }
}
