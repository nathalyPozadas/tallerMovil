import 'package:try1/src/pages/clientes_page.dart';
import 'package:try1/src/pages/equipos_page.dart';
import 'package:try1/src/pages/detalle_equipo_page.dart';
import 'package:try1/src/pages/inspeccion_page.dart';
import 'package:try1/src/pages/login_page.dart';
import 'package:try1/src/pages/sucursales_page.dart';
import 'package:try1/src/util/preferencias_usuario.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: prefs.getPagina(),
      routes: {
        LoginPage.routeName : ( BuildContext context ) => LoginPage(),
        ClientesPage.routeName : ( BuildContext context ) => ClientesPage(),
        SucursalesPage.routeName : ( BuildContext context ) => SucursalesPage(),
        EquiposPage.routeName : ( BuildContext context ) => EquiposPage(),
        DetalleEquipoPage.routeName: (BuildContext context)=> DetalleEquipoPage(),
        InspeccionPage.routeName: (BuildContext context)=> InspeccionPage()
      },
    );
  }
}