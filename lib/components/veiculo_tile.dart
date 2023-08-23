import 'package:flutter/material.dart';
import 'package:veiculos/routes/app_routes.dart';

void put(Veiculo veiculo) {
  if (veiculo == null) {
    return;
  }

  if (veiculo.id != null &&
      veiculo.id.trim().isNotEmpty &&
      _items.containsKey(veiculo.id)) {
    _items.update(
      veiculo.id,
      (_) => Veiculo(
        id: veiculo.id,
        name: veiculo.name,
        placa: veiculo.placa,
        avatar: veiculo.avatar,
      ),
    );
  } else {
    final id = Random().nextDouble().toString();
    _items.putIfAbsent(
      id,
      () => Veiculo(
        id: id,
        name: veiculo.name,
        placa: veiculo.placa,
        avatar: veiculo.avatar,
      ),
    );
  }
}

void remove(Veiculo veiculo) {
  if (veiculo != null && veiculo.id != null) {
    _items.remove(veiculo.id);
  }
}

class Veiculo {
  final String id;
  final String name;
  final String placa;
  final String avatar;

  Veiculo(
    this.id,
    @required this.name,
    @required this.placa,
    this.avatar,
  );
}

class VeiculoTile extends StatelessWidget {
  final Veiculo veiculo;
  const VeiculoTile(this.veiculo);

  @override
  Widget build(BuildContext context) {
    final avatar = veiculo.avatar == null || veiculo.avatar.isEmpty
        ? CircleAvatar(child: Icon(Icons.vehicle))
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
              icon: Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.VEICULO_FORM,
                  arguments: veiculo,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir veículo'),
                    content: Text('Confirmar?'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: () {
                          Veiculo.remove(veiculo);
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
