import 'dart:js';

import 'package:flutter/material.dart';
import 'package:veiculos/models/veiculo.dart';
//import 'package:veiculos/provider/veiculos.dart';
//import 'package:provider/provider.dart';

class VeiculoForm extends StatelessWidget {
  VeiculoForm({super.key});
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
    final veiculo = ModalRoute.of(context)?.settings.arguments as Veiculo;

    _loadFormData(veiculo);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de veículo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState!.validate();
              if (isValid) {
                _form.currentState?.save();
                put(Veiculo(
                  veiculo.id,
                  veiculo.name,
                  veiculo.placa,
                  veiculo.avatar,
                ));
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }

                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['placa'],
                decoration: const InputDecoration(labelText: 'Placa'),
                onSaved: (value) => _formData['placa'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
