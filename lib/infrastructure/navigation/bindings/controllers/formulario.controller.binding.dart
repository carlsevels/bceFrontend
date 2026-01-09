import 'package:get/get.dart';

import '../../../../presentation/formulario/controllers/formulario.controller.dart';

class FormularioControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormularioController>(
      () => FormularioController(),
    );
  }
}
