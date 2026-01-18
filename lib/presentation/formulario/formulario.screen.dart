import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bcefrontend/presentation/formulario/controllers/formulario.controller.dart';

class FormularioScreen extends GetView<FormularioController> {
  const FormularioScreen({Key? key}) : super(key: key);

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
          SliverAppBar(
            backgroundColor: background,
            elevation: 0,
            pinned: true,
            centerTitle: true,
            leading: const BackButton(color: textDark),
            title: const Text("Registro de Usuario", style: TextStyle(color: textDark, fontSize: 16, fontWeight: FontWeight.bold)),
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
                _buildSectionTitle("DATOS PERSONALES", Icons.person_add_alt_1_rounded),
                _modernInput(label: "Correo electrónico", icon: Icons.alternate_email_rounded, type: TextInputType.emailAddress, controller: controller.emailController),
                const SizedBox(height: 16),
                _modernInput(label: "Nombre(s)", icon: Icons.badge_outlined, controller: controller.nombreController),
                const SizedBox(height: 16),
                _modernInput(label: "Apellido Paterno", controller: controller.apellidoPaternoController),
                const SizedBox(height: 16),
                _modernInput(label: "Apellido Materno", controller: controller.apellidoMaternoController),
                const SizedBox(height: 16),
                _modernInput(label: "CURP", icon: Icons.fingerprint_rounded, controller: controller.curpController),
                const SizedBox(height: 16),
                _buildDatePicker(context),
                const SizedBox(height: 16),
                _buildGenderDropdown(),
                const SizedBox(height: 32),
                _buildSectionTitle("CONTACTO Y UBICACIÓN", Icons.location_on_rounded),
                _modernInput(label: "Número de celular", icon: Icons.phone_iphone_rounded, type: TextInputType.phone, controller: controller.numCelularController),
                const SizedBox(height: 16),
                _modernInput(label: "Calle y número", icon: Icons.home_rounded, controller: controller.calleNumeroController),
                const SizedBox(height: 16),
                _modernInput(label: "Colonia", controller: controller.coloniaController),
                const SizedBox(height: 16),
                _modernInput(label: "Municipio", controller: controller.municipioController),
                const SizedBox(height: 16),
                _modernInput(label: "Código Postal", type: TextInputType.number, controller: controller.codigoPostalController),
                const SizedBox(height: 16),
                _modernInput(label: "Escolaridad", controller: controller.escolaridadController),
                const SizedBox(height: 16),
                _modernInput(label: "Ocupacion", controller: controller.ocupacionController),
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

  // --- WIDGETS DE APOYO ---

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("BIBLIOTECA CENTRAL DEL ESTADO", style: TextStyle(color: primaryBlue.withOpacity(0.8), fontWeight: FontWeight.w800, fontSize: 12, letterSpacing: 1.2)),
        const SizedBox(height: 8),
        const Text("Fray Servando\nTeresa de Mier", style: TextStyle(color: textDark, fontSize: 32, fontWeight: FontWeight.w900, height: 1.1)),
      ],
    );
  }

  Widget _buildPrivacidadDeDatos() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFFE2E8F0))),
      child: ListTile(
        leading: const Icon(Icons.shield_outlined, color: Colors.green),
        title: const Text("Privacidad de Datos", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
        onTap: () => _mostrarAvisoPrivacidad(),
      ),
    );
  }

  void _mostrarAvisoPrivacidad() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Aviso de Privacidad", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            const Text("Sus datos están protegidos por la Biblioteca Central del Estado."),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => Get.back(), child: const Text("ENTENDIDO"))
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(children: [Icon(icon, size: 18, color: primaryBlue), const SizedBox(width: 8), Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: textLight))]);
  }

  Widget _modernInput({required String label, IconData? icon, TextInputType type = TextInputType.text, TextEditingController? controller}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE2E8F0))),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(labelText: label, prefixIcon: icon != null ? Icon(icon, color: primaryBlue) : null, border: InputBorder.none, contentPadding: const EdgeInsets.all(16)),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? picked = await showDatePicker(context: context, initialDate: DateTime(2000), firstDate: DateTime(1920), lastDate: DateTime.now());
        if (picked != null) controller.fechaNacimiento.value = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      },
      child: Container(
        height: 58,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE2E8F0))),
        child: Row(children: [const Icon(Icons.calendar_month_rounded, color: primaryBlue), const SizedBox(width: 12), Obx(() => Text(controller.fechaNacimiento.value.isEmpty ? "Fecha de Nacimiento" : controller.fechaNacimiento.value))]),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE2E8F0))),
      child: Obx(() => DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: controller.generoSeleccionado.value.isEmpty ? null : controller.generoSeleccionado.value,
          hint: const Text("Género"),
          items: ["Masculino", "Femenino", "Otro"].map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
          onChanged: (val) => controller.generoSeleccionado.value = val!,
        ),
      )),
    );
  }

  Widget _buildPhotoPicker() {
    return Obx(() {
      final tieneFoto = kIsWeb ? controller.webImage.value != null : controller.imagenSeleccionada.value != null;
      return GestureDetector(
        onTap: () => !tieneFoto ? controller.seleccionarImagen(ImageSource.gallery) : _mostrarImagenCompleta(),
        child: Container(
          height: 200,
          decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(24), border: Border.all(color: const Color(0xFFCBD5E1))),
          child: !tieneFoto 
            ? const Center(child: Icon(Icons.add_a_photo_rounded, size: 48, color: primaryBlue))
            : ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    kIsWeb ? Image.memory(controller.webImage.value!, fit: BoxFit.cover) : Image.file(controller.imagenSeleccionada.value!, fit: BoxFit.cover),
                    Positioned(right: 10, top: 10, child: CircleAvatar(backgroundColor: Colors.black54, child: IconButton(icon: const Icon(Icons.close, color: Colors.white), onPressed: controller.eliminarImagen))),
                  ],
                ),
              ),
        ),
      );
    });
  }

  void _mostrarImagenCompleta() {
    Get.to(() => Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent, leading: const CloseButton(color: Colors.white)),
      body: Center(child: kIsWeb ? Image.memory(controller.webImage.value!) : Image.file(controller.imagenSeleccionada.value!)),
    ));
  }

  Widget _buildSubmitButton() {
    return SizedBox(width: double.infinity, height: 60, child: ElevatedButton(onPressed: () => controller.createRegisterUser(), style: ElevatedButton.styleFrom(backgroundColor: primaryBlue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))), child: const Text("ENVIAR REGISTRO", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))));
  }
}