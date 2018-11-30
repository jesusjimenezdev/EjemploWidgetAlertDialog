import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum DialogAction {
  yes,
  no
}


class _MyHomePageState extends State<MyHomePage> {

  String inputValue = "";

  void _showAlert(String value) {
    AlertDialog dialog = new AlertDialog(
      content: new Text(value),
      actions: <Widget>[
        new FlatButton(onPressed: () {_alertResult(DialogAction.yes);}, child: new Text("Aceptar")),
        new FlatButton(onPressed: () {_alertResult(DialogAction.no);}, child: new Text("Cancelar")),
      ],
    );
    
    showDialog(context: context, child: dialog);
  }

  void _onChanged(String value) {
    setState(() {
      inputValue = value;
    });
  }

  void _alertResult(DialogAction action) {
    if(action == DialogAction.no) {
      Navigator.pop(context);
    }
    print("Has pulsado: $action");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Titulo"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                hintText: "Pon el texto",
              ),
              onChanged: (String value){ _onChanged(value); },
            ),
            new RaisedButton(
                child: new Text("Ver alerta"),
                onPressed: () {_showAlert(inputValue);},
            )
          ],
        ),
        )
      ),
    );
  }
}
