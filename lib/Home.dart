import 'package:flutter/material.dart';

import 'main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' \$ Conversor \$'),
        backgroundColor: Colors.amber,
        centerTitle: true,

      ),
      body: FutureBuilder<Map>(
          future: getData(),
          builder: (contex, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator()//Text('Carregando dados'),
              );
            default:
              if(snapshot.hasError){
                return const Center(
                  child: Text('Erro ao carregar dados',
                  style: TextStyle(color: Colors.amber,
                    fontSize: 25.0
                  ),
                    textAlign: TextAlign.center,
                  ),
                );

              }else {
                return Container(
                  color: Colors.green,);

              }
          }
          }
          )
    );
  }
}
