import 'package:flutter/material.dart';
import 'package:veiculos/models/veiculo.dart';
import 'package:veiculos/routes/app_routes.dart';

class VeiculoTile extends StatelessWidget {
  final Veiculo veiculo;
  const VeiculoTile(this.veiculo);

  @override
  Widget build(BuildContext context) {
    final avatar = veiculo.avatar == null || veiculo.avatar.isEmpty
        ? const CircleAvatar(child: Icon(Icons.car_crash))
        : CircleAvatar(backgroundImage: NetworkImage(veiculo.avatar));

    return ListTile(
      leading: avatar,
      title: Text(veiculo.name),
      subtitle: Text(veiculo.placa),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.veiculoForm,
                  arguments: veiculo,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir veículo'),
                    content: const Text('Confirmar?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Sim'),
                        onPressed: () {
                          remove(veiculo);
                          Navigator.of(context)
                              .pop(); // Feche o diálogo após a exclusão
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
