import 'package:flutter/material.dart';

void main() => runApp(const AdicionarRemoverVeiculo());

class meus_veiculos extends StatelessWidget {
    const AdicionarRemoverVeiculo({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Scaffold(
                appBar: AppBar(
                   title: const Text('Controle de Acesso')
                )
                String displayedString = "Meus veículos:";
            )
            routes: {
                '/adicionar_veiculo': (context) => const AdicionarVeiculo(),
                '/remover_veiculo': (context) => const RemoverVeiculo(),
            }
        )
    }
}

class Veiculo {
  final String nome;
  final String placa;

  Veiculo(
    this.nome,
    this.placa,
  );

  @override
  String toString() {
    return 'Veiculo{nome: $nome, placa: $placa}';
  }
}