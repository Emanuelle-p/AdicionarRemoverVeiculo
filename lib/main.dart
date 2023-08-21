import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatforms
            )
            routes: {
                AppRoutes.HOME: (_) => MeusVeiculosList()
                AppRoutes.VEICULO_FORM: (_) => VeiculoForm()
            },
        );
    }
}