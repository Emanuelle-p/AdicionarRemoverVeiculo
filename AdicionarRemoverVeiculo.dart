import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_adicionar_remover_veiculo/data/dummy_veiculos.dart';
import 'package:flutter_adicionar_remover_veiculo/models/veiculo.dart';

void put(Veiculo veiculo){
    if(veiculo == null){
        return;
    }

    if(Veiculo.id != null && 
            veiculo.id.trim().isNotEmpty && 
            _items.containsKey(Veiculo.id)) {
        _items.update(Veiculo.id, (_) => Veiculo(
            id: Veiculo.id,
            name = Veiculo.name,
            avatar = Veiculo.avatar,
    ));
    } else {
        final id = Random().nextDouble().toString();
        _items.putIfAbsent(
            id,
            () => Veiculo(
                id: id,
                name: Veiculo.name,
                avatar: Veiculo.avatar,
            ),
        );
    }
}

void remove(Veiculo veiculo) {
    if(veiculo != null && veiculo.id != null){
        _items.remove(Veiculo.id);
    }
}