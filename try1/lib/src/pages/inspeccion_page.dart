import 'package:flutter/material.dart';
import 'package:try1/src/util/preferencias_usuario.dart';
import 'package:try1/src/widgets/menu_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InspeccionPage extends StatefulWidget {
  static final String routeName = 'inspeccion';

  @override
  _InspeccionPageState createState() => _InspeccionPageState();
}

class _InspeccionPageState extends State<InspeccionPage> {
  var eCanioPesca = 0;
  var eZuncho = 0;
  var eChasis = 0;
  var eRueda = 0;
  var eRosca = 0;
  var eManguera = 0;
  var eValvula = 0;
  var eTobera = 0;
  var eRobinete = 0;
  var ePalanca = 0;
  var eManometro = 0;
  var eVastago = 0;
  var eDifusor = 0;
  var eDisco = 0;
  var resultado = 0;

  @override
  Widget build(BuildContext context) {
    final int args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("Inspección"),
        ),
        drawer: MenuWidget(),
        body: Container(
            child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(15.0),
                children: <Widget>[
              SizedBox(height: 5),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 7.0,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Column(
                        children: [
                          SizedBox(height: 10.0),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: "Caño Pesca",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          RadioListTile(
                            title: Text('Revisado en condiciones'),
                            value: 0,
                            groupValue: eCanioPesca,
                            onChanged: (value) {
                              setState(() {
                                eCanioPesca = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reparado'),
                            value: 1,
                            groupValue: eCanioPesca,
                            onChanged: (value) {
                              setState(() {
                                eCanioPesca = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reemplazado'),
                            value: 2,
                            groupValue: eCanioPesca,
                            onChanged: (value) {
                              setState(() {
                                eCanioPesca = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.0),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: "Zuncho",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          RadioListTile(
                            title: Text('Revisado en condiciones'),
                            value: 0,
                            groupValue: eZuncho,
                            onChanged: (value) {
                              setState(() {
                                eZuncho = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reparado'),
                            value: 1,
                            groupValue: eZuncho,
                            onChanged: (value) {
                              setState(() {
                                eZuncho = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reemplazado'),
                            value: 2,
                            groupValue: eZuncho,
                            onChanged: (value) {
                              setState(() {
                                eZuncho = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.0),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: "Chasis",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          RadioListTile(
                            title: Text('Revisado en condiciones'),
                            value: 0,
                            groupValue: eChasis,
                            onChanged: (value) {
                              setState(() {
                                eChasis = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reparado'),
                            value: 1,
                            groupValue: eChasis,
                            onChanged: (value) {
                              setState(() {
                                eChasis = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reemplazado'),
                            value: 2,
                            groupValue: eChasis,
                            onChanged: (value) {
                              setState(() {
                                eChasis = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.0),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: "Rueda",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          RadioListTile(
                            title: Text('Revisado en condiciones'),
                            value: 0,
                            groupValue: eRueda,
                            onChanged: (value) {
                              setState(() {
                                eRueda = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reparado'),
                            value: 1,
                            groupValue: eRueda,
                            onChanged: (value) {
                              setState(() {
                                eRueda = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reemplazado'),
                            value: 2,
                            groupValue: eRueda,
                            onChanged: (value) {
                              setState(() {
                                eRueda = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.0),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: "Rosca",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          RadioListTile(
                            title: Text('Revisado en condiciones'),
                            value: 0,
                            groupValue: eRosca,
                            onChanged: (value) {
                              setState(() {
                                eRosca = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reparado'),
                            value: 1,
                            groupValue: eRosca,
                            onChanged: (value) {
                              setState(() {
                                eRosca = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reemplazado'),
                            value: 2,
                            groupValue: eRosca,
                            onChanged: (value) {
                              setState(() {
                                eRosca = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.0),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: "Manguera",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          RadioListTile(
                            title: Text('Revisado en condiciones'),
                            value: 0,
                            groupValue: eManguera,
                            onChanged: (value) {
                              setState(() {
                                eManguera = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reparado'),
                            value: 1,
                            groupValue: eManguera,
                            onChanged: (value) {
                              setState(() {
                                eManguera = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reemplazado'),
                            value: 2,
                            groupValue: eManguera,
                            onChanged: (value) {
                              setState(() {
                                eManguera = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.0),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: "Valvula",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          RadioListTile(
                            title: Text('Revisado en condiciones'),
                            value: 0,
                            groupValue: eValvula,
                            onChanged: (value) {
                              setState(() {
                                eValvula = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reparado'),
                            value: 1,
                            groupValue: eValvula,
                            onChanged: (value) {
                              setState(() {
                                eValvula = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reemplazado'),
                            value: 2,
                            groupValue: eValvula,
                            onChanged: (value) {
                              setState(() {
                                eValvula = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.0),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: "Tobera",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          RadioListTile(
                            title: Text('Revisado en condiciones'),
                            value: 0,
                            groupValue: eTobera,
                            onChanged: (value) {
                              setState(() {
                                eTobera = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reparado'),
                            value: 1,
                            groupValue: eTobera,
                            onChanged: (value) {
                              setState(() {
                                eTobera = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reemplazado'),
                            value: 2,
                            groupValue: eTobera,
                            onChanged: (value) {
                              setState(() {
                                eTobera = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.0),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: "Robinete",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          RadioListTile(
                            title: Text('Revisado en condiciones'),
                            value: 0,
                            groupValue: eRobinete,
                            onChanged: (value) {
                              setState(() {
                                eRobinete = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reparado'),
                            value: 1,
                            groupValue: eRobinete,
                            onChanged: (value) {
                              setState(() {
                                eRobinete = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reemplazado'),
                            value: 2,
                            groupValue: eRobinete,
                            onChanged: (value) {
                              setState(() {
                                eRobinete = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.0),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: "Palanca",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          RadioListTile(
                            title: Text('Revisado en condiciones'),
                            value: 0,
                            groupValue: ePalanca,
                            onChanged: (value) {
                              setState(() {
                                ePalanca = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reparado'),
                            value: 1,
                            groupValue: ePalanca,
                            onChanged: (value) {
                              setState(() {
                                ePalanca = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reemplazado'),
                            value: 2,
                            groupValue: ePalanca,
                            onChanged: (value) {
                              setState(() {
                                ePalanca = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.0),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: "Manómetro",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          RadioListTile(
                            title: Text('Revisado en condiciones'),
                            value: 0,
                            groupValue: eManometro,
                            onChanged: (value) {
                              setState(() {
                                eManometro = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reparado'),
                            value: 1,
                            groupValue: eManometro,
                            onChanged: (value) {
                              setState(() {
                                eManometro = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reemplazado'),
                            value: 2,
                            groupValue: eManometro,
                            onChanged: (value) {
                              setState(() {
                                eManometro = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.0),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: "Vastago",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          RadioListTile(
                            title: Text('Revisado en condiciones'),
                            value: 0,
                            groupValue: eVastago,
                            onChanged: (value) {
                              setState(() {
                                eVastago = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reparado'),
                            value: 1,
                            groupValue: eVastago,
                            onChanged: (value) {
                              setState(() {
                                eVastago = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reemplazado'),
                            value: 2,
                            groupValue: eVastago,
                            onChanged: (value) {
                              setState(() {
                                eVastago = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.0),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: "Difusor",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          RadioListTile(
                            title: Text('Revisado en condiciones'),
                            value: 0,
                            groupValue: eDifusor,
                            onChanged: (value) {
                              setState(() {
                                eDifusor = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reparado'),
                            value: 1,
                            groupValue: eDifusor,
                            onChanged: (value) {
                              setState(() {
                                eDifusor = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reemplazado'),
                            value: 2,
                            groupValue: eDifusor,
                            onChanged: (value) {
                              setState(() {
                                eDifusor = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.0),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: "Disco",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          RadioListTile(
                            title: Text('Revisado en condiciones'),
                            value: 0,
                            groupValue: eDisco,
                            onChanged: (value) {
                              setState(() {
                                eDisco = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reparado'),
                            value: 1,
                            groupValue: eDisco,
                            onChanged: (value) {
                              setState(() {
                                eDisco = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Reemplazado'),
                            value: 2,
                            groupValue: eDisco,
                            onChanged: (value) {
                              setState(() {
                                eDisco = value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 7.0,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          text: "Resultado",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      RadioListTile(
                        title: Text('Aprobado'),
                        value: 0,
                        groupValue: resultado,
                        onChanged: (value) {
                          setState(() {
                            resultado = value;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text('Rechazado'),
                        value: 1,
                        groupValue: resultado,
                        onChanged: (value) {
                          setState(() {
                            resultado = value;
                          });
                        },
                      ),
                      SizedBox(height: 20.0),
                    ],
                  )),
              RaisedButton(
                onPressed: () async {
                  final resInspeccion = {
                    "eCanioPesca": estadoComponente(eCanioPesca),
                    "eZuncho": estadoComponente(eZuncho),
                    "eChasis": estadoComponente(eChasis),
                    "eRueda": estadoComponente(eRueda),
                    "eRosca": estadoComponente(eRosca),
                    "eManguera": estadoComponente(eManguera),
                    "eValvula": estadoComponente(eValvula),
                    "eTobera": estadoComponente(eTobera),
                    "eRobinete": estadoComponente(eRobinete),
                    "ePalanca": estadoComponente(ePalanca),
                    "eManometro": estadoComponente(eManometro),
                    "eVastago": estadoComponente(eVastago),
                    "eDifusor": estadoComponente(eDifusor),
                    "eDisco": estadoComponente(eDisco),

                    "carga": "0.0",
                    "observacion": "",
                    "resultado": resultadoIns(resultado)
                  };

                  final prefs = new PreferenciasUsuario();
                  final resp = await http.post(
                      'http://glacial-eyrie-03654.herokuapp.com/api/inspeccionM/'+args.toString(),
                      headers: {
                        "Accept": "application/json",
                        "Authorization": prefs.token,
                        "Content-Type": "application/x-www-form-urlencoded"
                      },
                      body: resInspeccion);
                  if (resp.statusCode == 200) {
                    print("ok");
                  } else {
                    print("no ok");
                    print(resp.statusCode);
                    print(resp.body);
                  }
                  Navigator.of(context).pop();
                },
                child: Text("data"),
              )
            ])));
  }

  _enviarResultados(int id) {
    var a = {
      "eCanioPesca": eCanioPesca,
      "eZuncho": eZuncho,
      "eChasis": eChasis,
      "eRueda": eRueda,
      "eRosca": eRosca,
      "eManguera": eManguera,
      "eValvula": eValvula,
      "eTobera": eTobera,
      "eRobinete": eRobinete,
      "ePalanca": ePalanca,
      "eManometro": eManometro,
      "eVastago": eVastago,
      "eDifusor": eDifusor,
      "eDisco": eDisco,
      "carga": 0,
      "observacion": "",
      "resultado": resultado,
      "equipo_id": id
    };
  }

  String estadoComponente(int e){
      if(e==0){
        return "Revisado en condiciones";
      }
      if(e==1){
        return "Reparado";
      }
      return "Reemplazado";
  }

  String resultadoIns(int res){
    if(res==0){
      return "Aprobado";
    }
    return "Rechazado";
  }

}
