import 'package:flutter/material.dart';
import 'package:myapplication/routes/app_routes.dart';
import 'package:myapplication/data/dummy_veiculos.dart';
import 'package:myapplication/components/veiculo_tile.dart';

class MeusVeiculos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final veiculos = DUMMY_VEICULOS;

    return Scaffold(
      appBar: AppBar(
        title: Text('Meus veículos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.VEICULO_FORM,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: veiculos.length,
        itemBuilder: (ctx, i) => VeiculoTile(veiculos[i]),
      ),
    );
  }
}
