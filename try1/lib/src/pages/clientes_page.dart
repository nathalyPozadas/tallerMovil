import 'package:flutter/material.dart';
import 'package:try1/src/pages/sucursales_page.dart';
import 'package:try1/src/util/preferencias_usuario.dart';
import 'package:try1/src/widgets/menu_widget.dart';
import 'package:http/http.dart' as http;

class ClientesPage extends StatefulWidget {
  static final String routeName = 'clientes';

  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {







  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Clientes"),
        ),
        drawer: MenuWidget(),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => _itemLista(context, index)));
  }

  Widget _itemLista(BuildContext context, int index) {
    //_obtenerClientes();
    return Container(
      child:InkWell(
              onTap: () {
                Future.delayed(Duration.zero, () {
                  _verSucursales(context);
                });
              },
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Title(color: Colors.black, child: Text("Cliente")),
                    )
                  ],
                ),
              )),
    );
  }

  _verSucursales(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SucursalesPage()));
  }
/*
  _obtenerClientes() async{
    var url = 'http://127.0.0.1:8000/api/clientesM';
     Map<String, String> requestHeaders = {
       'Accept': 'application/json',
       'Authorization': PreferenciasUsuario().token
     };
    var response = await http.get(url,headers: requestHeaders);
    print(response.statusCode);
  }
*/


}
