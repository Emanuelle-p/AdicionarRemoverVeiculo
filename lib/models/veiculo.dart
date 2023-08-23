import 'dart:math';
import 'package:veiculos/data/dummy_veiculos.dart';

final Map<String, Veiculo> _items = {...dummy_veiculos};

List<Veiculo> get all {
  return [..._items.values];
}

int get count {
  return _items.length;
}

Veiculo byIndex(int i) {
  return _items.values.elementAt(i);
}

void put(Veiculo veiculo) {
  if (veiculo == null) {
    return;
  }

  if (veiculo.id != null && veiculo.id.trim().isNotEmpty) {
    _items.update(
      veiculo.id,
      (_) => Veiculo(veiculo.id, veiculo.name, veiculo.placa, veiculo.avatar),
    );
  } else {
    final id = Random().nextDouble().toString();
    _items.putIfAbsent(
      id,
      () => Veiculo(id, veiculo.name, veiculo.placa, veiculo.avatar),
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
    this.name,
    this.placa,
    this.avatar,
  );
}
