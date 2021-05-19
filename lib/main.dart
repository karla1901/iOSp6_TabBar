import 'package:flutter/material.dart';

void main() => runApp(KarlApp());

class KarlApp extends StatefulWidget {
  @override
  //generando el estado de el widget
  _KarlAppState createState() => _KarlAppState();
} //fin de clase KarlApp

class _KarlAppState extends State<KarlApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, theme: ThemeData(brightness: Brightness.dark), home: Principal());
  }
} //fin de clase _KarlAppState

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
} //fin de clase principal

class _PrincipalState extends State<Principal> with SingleTickerProviderStateMixin {
  TabController controller;
  void initState() {
    super.initState();
    controller = TabController(
      length: 5,
      vsync: this,
      initialIndex: 0,
    );
  } //fin de void iniState con 5 iconos

  Widget card(String text) {
    return Card(
      color: Colors.indigo[400],
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Center(child: Text(text)),
      ),
    );
  } //fin de tarjeta

  Tab tab(String text, Icon icon) {
    return Tab(
      icon: icon,
      text: text,
    );
  } //fin de tab enviando texto e icono

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navegador con Icons Karliux"),
        centerTitle: true,
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0.0,
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          card("Inicio Tarjeta 1"),
          card("Ideas"),
          card("Compañía"),
          card("Sin señal"),
          card("Wifi"),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        isScrollable: true,
        tabs: <Widget>[
          tab("Inicio", Icon(Icons.home)),
          tab("Ideas", Icon(Icons.lightbulb_outline)),
          tab("Telefonía", Icon(Icons.atm)),
          tab("Señal", Icon(Icons.signal_wifi_off)),
          tab("Wifi", Icon(Icons.wifi)),
        ],
      ),
    ); //fin de scaffold
  } //fin de ejecutor
} //fin de principalstate