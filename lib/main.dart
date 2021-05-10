import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Fatec Ferraz - Contador de Alunos",
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _mensagem = "Pode Entrar!";

  _alteraContador(int i) {
    setState(() {
      if (!(_pessoa == 0 && i == -1)) _pessoa += i;

      if (_pessoa <= 0) {
        _mensagem = "Não chegou ninguém ainda!!!";
      } else if (_pessoa >= 50) {
        _mensagem = "Lotado!!! Por favor, aguarde!!!";
      } else {
        _mensagem = "Pode Entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/fatec_ferraz_3.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pessoas: " + _pessoa.toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextButton(
                    child: Text(
                      "-1",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      _alteraContador(-1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextButton(
                    child: Text(
                      "+1",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.lightGreen,
                      ),
                    ),
                    onPressed: () {
                      _alteraContador(1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _mensagem,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 25,
              ),
            )
          ],
        ),
      ],
    );
  }
}
