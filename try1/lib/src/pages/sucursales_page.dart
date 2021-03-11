import 'package:flutter/material.dart';
import 'package:try1/src/modelos/sucursal_modelo.dart';
import 'package:try1/src/pages/equipos_page.dart';
import 'package:try1/src/util/preferencias_usuario.dart';
import 'package:try1/src/widgets/menu_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SucursalesPage extends StatefulWidget {
  static final String routeName = 'sucursales';

  @override
  _SucursalesPageState createState() => _SucursalesPageState();
}

class _SucursalesPageState extends State<SucursalesPage> {
    Future<List<Sucursal>> _getSucursales(int id) async {
     final prefs = new PreferenciasUsuario();
     print(prefs.token);
    final resp = await http.get('http://glacial-eyrie-03654.herokuapp.com/api/sucursalesM/'+id.toString(), headers: {
      "Accept": "application/json",
      "Authorization": prefs.token}
    );
    var jsonData = json.decode(resp.body);
    List<Sucursal> listSuc=[];
    for(var a in jsonData){
        Sucursal sucursal = Sucursal(a['id'], a['nombre'], a['direccion']);
        listSuc.add(sucursal);
    }

    return listSuc;

  }



  @override
  Widget build(BuildContext context) {
    final int args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sucursales"),
      ),
      drawer: MenuWidget(),
      body: Container(
          child: FutureBuilder(
            future: _getSucursales(args),
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
                  _verEquipos(context,snapshot.data[index].id);
                });
              },
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Title(color: Colors.black, child: Text(snapshot.data[index].nombre)),
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



  _verEquipos(BuildContext context, int id) {
    Navigator.pushNamed(context, EquiposPage.routeName,arguments: id);
  }

}