import 'package:flutter/material.dart';

import 'main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double? dolar;
  double? euro;

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
            builder: (contex, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(
                      child:
                          CircularProgressIndicator() //Text('Carregando dados'),
                      );
                default:
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'Erro ao carregar dados',
                        style: TextStyle(color: Colors.amber, fontSize: 25.0),
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    dolar =
                        snapshot.data!['results']['currencies']['USD']['buy'];
                    euro =
                        snapshot.data!['results']['currencies']['EUR']['buy'];
                    return SingleChildScrollView(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          Icon(
                            Icons.monetization_on,
                            size: 150.0,
                            color: Colors.amber,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Reais',
                              labelStyle: TextStyle(color: Colors.amber),
                              border: OutlineInputBorder(),
                              prefixText: 'R\$'
                            ),
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 25
                            ),
                          ),
                          Divider(),
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Dólar',
                                labelStyle: TextStyle(color: Colors.amber),
                                border: OutlineInputBorder(),
                                prefixText: 'US\$'
                            ),
                            style: TextStyle(
                                color: Colors.amber,
                                fontSize: 25
                            ),
                          ),
                          Divider(),
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Euros',
                                labelStyle: TextStyle(color: Colors.amber),
                                border: OutlineInputBorder(),
                                prefixText: '€'
                            ),
                            style: TextStyle(
                                color: Colors.amber,
                                fontSize: 25
                            ),
                          )
                        ],
                      ),
                    );
                  }
              }
            }));
  }
}
