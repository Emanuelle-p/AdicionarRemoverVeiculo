import 'package:flutter/material.dart';

void main() => runApp(const AdicionarVeiculo());


class AdicionarVeiculo extends State<button_adicionar_veiculo> {
    final TextEditingController _controladorNome = TextEditingController();
    final TextEditingController _controladorQuantidade = TextEditingController();
    final TextEditingController _controladorValor = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Scaffold(
                appBar: AppBar(
                   title: const Text('Adicionando veículo'),
                   theme: ThemeData(
                    primarySwatch: Colors.deepPurpleAccent[400],
                   )
                )
                body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        children: <Widget>[
                            TextField(
                                controller: _controladorNome,
                                decoration: InputDecoration(labelText: 'Nome'),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: TextField(
                                controller: _controladorPlaca,
                                decoration: InputDecoration(labelText: 'Placa'),
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(top: 16.0),
                                child: RaisedButton(
                                    child: Text('Adicionar'),
                                    onPressed: () {
                                        final String nome = _controladorNome.text;
                                        final String placa = _controladorPlaca.text;

                                        final Veiculo novoVeiculo = Veiculo(nome, placa);
                                        print(novoVeiculo);
                                    },
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}