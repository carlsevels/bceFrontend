import 'package:flutter/material.dart';
import 'package:get/get.dart';
// IMPORTANTE: Asegúrate de tener este import EXACTO
import 'package:flutter_web_plugins/flutter_web_plugins.dart'; 

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  // 1. Esto prepara el motor de Flutter antes de configurar la web
  WidgetsFlutterBinding.ensureInitialized();
  
  // 2. FORMA MANUAL: Esto sobreescribe cualquier otra configuración
  setUrlStrategy(const HashUrlStrategy()); 

  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, 
      initialRoute: initialRoute,
      getPages: Nav.routes,
    );
  }
}