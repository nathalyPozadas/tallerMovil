import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:try1/src/modelos/equipo_modelo.dart';
import 'package:try1/src/pages/detalle_equipo_page.dart';
import 'package:try1/src/util/preferencias_usuario.dart';
import 'package:try1/src/widgets/menu_widget.dart';

class EquiposPage extends StatefulWidget {
  static final String routeName = 'equipos';

  @override
  _EquiposPageState createState() => _EquiposPageState();
}

class _EquiposPageState extends State<EquiposPage> {
  Future<List<Equipo>> _getEquipos(int id) async {
    final prefs = new PreferenciasUsuario();
    final resp = await http.get(
        'http://glacial-eyrie-03654.herokuapp.com/api/equiposM/' +
            id.toString(),
        headers: {"Accept": "application/json", "Authorization": prefs.token});
    var jsonData = json.decode(resp.body);
    
    List<Equipo> listEqui = [];
    for (var a in jsonData) {
      Equipo equipo = Equipo(
          a['id'],
          a['nro_serie'],
          a['ano_fabricacion'],
          a['descripcion'],
          a['ubicacion'],
          a['capacidad'],
          a['unidad_medida'],
          a['presion_min'],
          a['presion_max']);
      listEqui.add(equipo);
    }

    return listEqui;

 
  }

  @override
  Widget build(BuildContext context) {
    final int args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text("Equipos"),
        ),
        drawer: MenuWidget(),
        body: Container(
          child: FutureBuilder(
              future: _getEquipos(args),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data);
                if (snapshot.data == null) {
                  return Container(child: Center(child: Text("Loading...")));
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: InkWell(
                              onTap: () {
                                Future.delayed(Duration.zero, () {
                                  _verDetalle(context,snapshot.data[index]);
                                });
                              },
                              child: Card(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      title: Title(
                                          color: Colors.black,
                                          child: Text("Extintor " +
                                              (index + 1).toString() +
                                              " - " +
                                              snapshot.data[index].nro_serie)),
                                      subtitle: Text(snapshot
                                          .data[index].ubicacion
                                          .toString()),
                                    )
                                  ],
                                ),
                              )),
                        );
                      });
                }
              }),
        ));
  }

  _verDetalle(BuildContext context, Equipo equipo) {
    Navigator.pushNamed(context, DetalleEquipoPage.routeName, arguments: equipo);
  }
}
