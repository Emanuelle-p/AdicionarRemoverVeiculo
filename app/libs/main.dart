import 'package:flutter/material.dart';
import 'package:myapplication/views/veiculo_form.dart';
import 'package:myapplication/views/MeusVeiculosList.dart';
import 'package:myapplication/views/veiculo_form.dart';
import 'package:myapplication/routes/app_routes.dart';
import 'package:myapplication/models/veiculo.dart';
import 'package:myapplication/data/dummy_veiculos.dart';
import 'package:myapplication/components/veiculo_tile.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              visualDensity: VisualDensity.adaptivePlatforms
          )
          routes: {
              AppRoutes.HOME: (_) => MeusVeiculosList()
              AppRoutes.VEICULO_FORM: (_) => VeiculoForm()
          },
      );
    }
}