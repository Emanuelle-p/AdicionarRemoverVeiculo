import 'package:flutter/material.dart';
import 'package:myapplication/models/veiculo.dart';

class VeiculoForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Veiculo veiculo) {
    if (veiculo != null) {
      _formData['id'] = veiculo.id;
      _formData['name'] = veiculo.name;
      _formData['placa'] = veiculo.placa;
      _formData['avatar'] = veiculo.avatar;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Veiculo veiculo = ModalRoute.of(context).settings.arguments;

    _loadFormData(veiculo);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de veículo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }

                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['placa'],
                decoration: InputDecoration(labelText: 'Placa'),
                onSaved: (value) => _formData['placa'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
