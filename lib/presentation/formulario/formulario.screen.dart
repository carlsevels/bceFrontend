import 'dart:io';
import 'package:bcefrontend/presentation/formulario/controllers/formulario.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// --- VISTA ---
class FormularioScreen extends GetView<FormularioController> {
  const FormularioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  _buildHeader(),
                  const SizedBox(height: 32),

                  _buildSectionTitle("DATOS PERSONALES"),
                  _modernInput(
                    label: "Correo electrónico",
                    icon: Icons.alternate_email_rounded,
                    type: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  _modernInput(
                    label: "Nombre(s)",
                    icon: Icons.person_outline_rounded,
                  ),
                  const SizedBox(height: 16),
                  _modernInput(label: "Apellido Paterno"),
                  const SizedBox(height: 16),
                  _modernInput(label: "Apellido Materno"),
                  const SizedBox(height: 16),
                  _modernInput(label: "CURP", icon: Icons.fingerprint_rounded),
                  const SizedBox(height: 16),

                  // FECHA DE NACIMIENTO
                  _buildDatePicker(context),
                  const SizedBox(height: 16),

                  // GÉNERO DROPDOWN
                  _buildGenderDropdown(),

                  const SizedBox(height: 32),
                  _buildSectionTitle("CONTACTO Y DOMICILIO"),
                  _modernInput(
                    label: "Número de celular",
                    icon: Icons.phone_iphone_rounded,
                    type: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  _modernInput(
                    label: "Calle y número",
                    icon: Icons.home_outlined,
                  ),
                  const SizedBox(height: 16),
                  _modernInput(
                    label: "Colonia",
                    icon: Icons.maps_home_work_rounded,
                  ),
                  const SizedBox(height: 16),
                  _modernInput(
                    label: "Municipio",
                    icon: Icons.location_city_rounded,
                  ),
                  const SizedBox(height: 16),
                  _modernInput(
                    label: "Código Postal",
                    icon: Icons.local_post_office_rounded,
                    type: TextInputType.number,
                  ),

                  const SizedBox(height: 32),
                  _buildSectionTitle("INFORMACIÓN ADICIONAL"),
                  _modernInput(
                    label: "Ocupación",
                    icon: Icons.work_outline_rounded,
                  ),
                  const SizedBox(height: 16),
                  _modernInput(
                    label: "Escolaridad",
                    icon: Icons.school_outlined,
                  ),
                  const SizedBox(height: 24),

                  // SELECTOR DE FOTO
                  _buildPhotoPicker(),

                  const SizedBox(height: 40),
                  _buildSubmitButton(),
                  const SizedBox(height: 40),
                ],
              ),
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF2563EB).withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.account_balance_rounded,
                size: 14,
                color: Colors.blue[800],
              ),
              const SizedBox(width: 6),
              Text(
                "SISTEMA DE REGISTRO",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: Colors.blue[800],
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Biblioteca Central\ndel Estado",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w900,
            color: Color(0xFF0F172A),
            height: 1.0,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Fray Servando Teresa de Mier",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.blueGrey[400],
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE2E8F0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.verified_user_rounded,
                    color: Colors.green[600],
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Privacidad de Datos",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                "La Biblioteca Central del Estado 'Fray Servando Teresa de Mier', está comprometida con la protección de sus datos personales, al ser responsable de su uso, manejo y confidencialidad mediante la continua revisión de nuestros procesos de protección de datos de manera física como electrónica.",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
                const SizedBox(height: 12),
              Text(
                "Los datos personales que le son recabados serán utilizados para la operación de los Servicios Bibliotecarios solicitados por usted, que nos permite brindarle una mejor atención.",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey[400],
          letterSpacing: 1.1,
        ),
      ),
    );
  }

  Widget _modernInput({
    required String label,
    IconData? icon,
    TextInputType type = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
          prefixIcon: icon != null
              ? Icon(icon, color: Colors.cyan, size: 20)
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
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
              "${picked.day}/${picked.month}/${picked.year}";
        }
      },
      child: Container(
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_today_rounded,
              color: Colors.cyan,
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
                      ? Colors.grey[500]
                      : Colors.black,
                  fontSize: 15,
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Obx(
        () => DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: Text(
              "Género",
              style: TextStyle(color: Colors.grey[500], fontSize: 14),
            ),
            value: controller.generoSeleccionado.value.isEmpty
                ? null
                : controller.generoSeleccionado.value,
            items: ["Masculino", "Femenino", "Otro", "Prefiero no elegir"].map((
              String val,
            ) {
              return DropdownMenuItem<String>(value: val, child: Text(val));
            }).toList(),
            onChanged: (val) => controller.generoSeleccionado.value = val!,
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoPicker() {
    return Obx(
      () => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.03),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blue.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.orange[600],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Foto de Identificación",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Necesaria para validación",
                        style: TextStyle(color: Colors.grey[500], fontSize: 12),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => controller.seleccionarImagenMock(),
                  child: const Text(
                    "Adjuntar",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            if (controller.rutaImagen.value.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    File(controller.rutaImagen.value),
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => Get.snackbar("Registro", "Enviando datos..."),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: const Text(
          "ENVIAR REGISTRO",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
