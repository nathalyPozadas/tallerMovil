
import 'package:try1/src/pages/clientes_page.dart';
import 'package:try1/src/pages/clientes_page.dart';
import 'package:try1/src/pages/login_page.dart';
import 'package:try1/src/util/preferencias_usuario.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {

  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(prefs.nombre),
            accountEmail: Text(prefs.email),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.blue,),
            title: Text('Principal'),
            onTap: (){
              Navigator.pushReplacementNamed(context, ClientesPage.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.blue,),
            title: Text('Log out'),
            onTap: (){
              //enviar logout             
              _logout(context);
            },
          ), 
          Divider(),
          

        ],
      ),
    );
  }


  _logout(BuildContext context) async {
    final prefs = new PreferenciasUsuario();
    final resp = await http.post('http://glacial-eyrie-03654.herokuapp.com/api/logout', headers: {
      "Accept": "application/json",
      "Authorization": prefs.token}
    );

    if(resp.statusCode == 204){
      final prefs = new PreferenciasUsuario();
      prefs.token = '';
      prefs.email = '';
      prefs.nombre = '';
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }

  }
}