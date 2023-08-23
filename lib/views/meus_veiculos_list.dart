import 'package:flutter/material.dart';
import 'package:veiculos/routes/app_routes.dart';
import 'package:veiculos/models/veiculo.dart';
import 'package:veiculos/components/veiculo_tile.dart';

class MeusVeiculosList extends StatelessWidget {
  const MeusVeiculosList({super.key});

  @override
  Widget build(BuildContext context) {
    //final Veiculo veiculos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus veículos'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.veiculoForm,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: count,
        itemBuilder: (ctx, i) => VeiculoTile(byIndex(i)),
      ),
    );
  }
}
