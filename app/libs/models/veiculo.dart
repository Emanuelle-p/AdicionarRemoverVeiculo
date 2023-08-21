import 'package:flutter/material.dart';

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
