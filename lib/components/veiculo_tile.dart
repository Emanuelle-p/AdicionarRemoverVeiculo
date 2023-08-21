import 'package:flutter/material.dart';

class VeiculoTile extends StatelessWidget {
    final Veiculo veiculo;
    const VeiculoTile(this.veiculo);
    @override
    Widget build(BuildContext context) {
        final avatar = veiculo.avatar == null || veiculo.avatar.isEmpty
            ? CircleAvatar(child: Icon(Icons.vehicle),)
            : CircleAvatar(backgroundImage: NetworkImage(veiculo.avatar))
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
                                    AppRoutes.VEICULO_FORM
                                    arguments: user,
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
                                                },
                                            ),
                                        ],
                                    ),
                                );
                                Veiculo.remove(veiculo);
                            },
                        ),
                    ],
                ),
            ),
        );
    }
}