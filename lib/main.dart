import 'package:bcefrontend/infrastructure/navigation/navigation.dart';
import 'package:bcefrontend/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart'; // Importa este

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  setUrlStrategy(null); 

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