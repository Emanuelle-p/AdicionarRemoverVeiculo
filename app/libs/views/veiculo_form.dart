import 'package:flutter/material.dart';

class VeiculoForm extends StatelessWidget {
    final _form = GlobalKey<FormState>();
    final Map<String, String> _formData = {};
    
    void _loadFormData(Veiculo veiculo){
        if(veiculo != null){
            _formData['id'] = Veiculo.id;
            _formData['name'] = Veiculo.name;
            _formData['placa'] = Veiculo.placa;
            _formData['avatar'] = Veiculo.avatar;
        }
    }

    //@override
    //void didChangeDependencies(){
      //super.didChangeDependencies();
    //}

    @override
    Widget build(BuildContext context){
        final Veiculo veiculo = ModalRoute.of(context).settings.arguments;
       
        _loadFormData(veiculo);

        return Scaffold(
            appBar: AppBar(
                title: Text('Formulário de veículo')
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.save),
                        onPressed: () {
                            final isValid = _form.currentState.validate();

                            if(isValid){
                                _form.currentState.save();
                                Navigator.of(context).pop();
                            }
                        },
                    ),
                ],
            ),
            body: Padding(
                padding: EdgeInsets.all(10),
                key: _form,
                child: Form(
                    child: Column(
                        children: <Widget>[
                            TextFormField(
                                initialValue: _formData['name'],
                                decoration: InputDecoration(laberText: 'Nome'),
                                validator: (value){
                                    if(value == null || valute.trim().isEmpty){
                                        return 'Nome inválido';
                                    }

                                    return null;
                                },
                                onSaved: (value) => _formData['name'] = value,
                            ),
                            TextFormField(
                                initialValue: _formData['placa'],
                                decoration: InputDecoration(laberText: 'Placa'),
                                onSaved: (value) => _formData['placa'] = value,
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}