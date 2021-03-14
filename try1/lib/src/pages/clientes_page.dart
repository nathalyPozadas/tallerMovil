import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:try1/src/modelos/cliente_modelo.dart';
import 'package:try1/src/pages/sucursales_page.dart';
import 'package:try1/src/util/preferencias_usuario.dart';
import 'package:try1/src/widgets/menu_widget.dart';

class ClientesPage extends StatefulWidget {
  static final String routeName = 'clientes';

  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
    Future<List<Cliente>> _getClientes() async {
     final prefs = new PreferenciasUsuario();
     print(prefs.token);
    final resp = await http.get('http://glacial-eyrie-03654.herokuapp.com/api/clientesM', headers: {
      "Accept": "application/json",
      "Authorization": prefs.token}
    );
    var jsonData = json.decode(resp.body);
    List<Cliente> listCl=[];
    for(var a in jsonData){
        Cliente cliente = Cliente(a['id'], a['nombre_empresa']);
        listCl.add(cliente);
    }

    return listCl;

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Clientes"),
      ),
      drawer: MenuWidget(),
      body: Container(
          child: FutureBuilder(
            future: _getClientes(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              print(snapshot.data);
              if(snapshot.data == null){
                return Container(
                  child: Center(
                    child: Text("Loading...")
                  )
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        child:InkWell(
              onTap: () {
                Future.delayed(Duration.zero, () {
                  _verSucursales(context,snapshot.data[index].id);
                });
              },
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Title(color: Colors.black, child: Text(snapshot.data[index].nombre_empresa)),
                    )
                  ],
                ),
              )),
                    
                    );
                  }
                );
              }
            }
        ),
      )
    );
  }

  _verSucursales(BuildContext context,int id) {
    Navigator.pushNamed(context, SucursalesPage.routeName,arguments: id);
  }
}
