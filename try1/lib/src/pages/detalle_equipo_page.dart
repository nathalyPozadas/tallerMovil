import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:try1/src/modelos/equipo_modelo.dart';
import 'package:try1/src/pages/equipos_page.dart';
import 'package:try1/src/pages/inspeccion_page.dart';
import 'package:try1/src/util/preferencias_usuario.dart';
import 'package:try1/src/widgets/menu_widget.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class DetalleEquipoPage extends StatefulWidget {
  static final String routeName = 'detalle_equipo';

  @override
  _DetalleEquipoPageState createState() => _DetalleEquipoPageState();
}

class _DetalleEquipoPageState extends State<DetalleEquipoPage> {
  var  ubi;
  @override
  Widget build(BuildContext context) {
     Equipo args = ModalRoute.of(context).settings.arguments;
    print(args.id);
    print(args.nro_serie);
    print(args.ubicacion);
    print(args.descripcion);

    return Scaffold(
        appBar: AppBar(
          title: Text("Detalle Equipo"),
        ),
        drawer: MenuWidget(),
        body: Container(
          child: ListView(
            children: [
              Card(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ListTile(
                  title: Text("Nro serie"),
                  subtitle: Text(args.nro_serie),
                ),
                ListTile(
                  title: Text('Tipo'),
                  subtitle: Text('Extintor de agua'),
                ),
                ListTile(
                  title: Text('Marca'),
                  subtitle: Text('Melisam'),
                ),
                ListTile(
                  title: Text('Descripción'),
                  subtitle: Text(args.descripcion),
                ),
                ListTile(
                  title: Text('Año Fabricación'),
                  subtitle: Text(args.ano_fabricacion.toString()),
                ),
                ListTile(
                  title: Text('Capacidad'),
                  subtitle: Text(args.capacidad + " " + args.unidad_medida),
                ),
                ListTile(
                  title: Text('Rango de presión'),
                  subtitle: Text(args.presion_min + " - " + args.presion_max),
                ),
              ])),
              InkWell(
                onLongPress: () {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Ubicación"),
                          content: TextField(onChanged: (valor){
                            args.ubicacion=valor;
        ubi=valor;
      },),
                          actions: [
                            MaterialButton(
                                elevation: 5.0,
                                child: Text("Actualizar"),
                                onPressed: () async {
                                  Position position =
                                      await Geolocator.getCurrentPosition(
                                          desiredAccuracy:
                                              LocationAccuracy.high);
                                  print(position.toString());
                                  final nueva_ubicacion = {
                                    'ubicacion': ubi,
                                    'latitud_ideal': position.latitude.toString(),
                                    'longitud_ideal': position.longitude.toString()
                                  };

                                  final prefs = new PreferenciasUsuario();
                                  final resp = await http.post(
                                      'http://glacial-eyrie-03654.herokuapp.com/api/actualizarGPSM/' +
                                          args.id.toString(),
                                      headers: {
                                        "Accept": "application/json",
                                        "Authorization": prefs.token,
                                        "Content-Type":
                                            "application/x-www-form-urlencoded"
                                      },
                                      body: nueva_ubicacion);
                                  if(resp.statusCode==200){
                                    print("ok");
                                  }else{
                                    print("no ok");
                                  }
                                  Navigator.of(context).pop();
                                })
                          ],
                        );
                      });
                },
                child: Card(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                     ListTile(
                      title: Text('Ubicación'),
                      subtitle: Text(args.ubicacion),
                    ),
                    const ListTile(
                      title: Text('GPS'),
                      subtitle: Text('ok'),
                    ),
                  ]),
                ),
              ),
              RaisedButton(
                  onPressed: () {
                    Future.delayed(Duration.zero, () {
                      _verInspeccion(context, args.id);
                    });
                  },
                  child: Text("Realizar Inspección")
                  )
            ],
          ),
        ));
  }

  _verInspeccion(BuildContext context, int id) {
    Navigator.pushNamed(context, InspeccionPage.routeName,arguments: id);
  }
}
