import 'package:asigname/src/providers/task.dart';
import 'package:asigname/src/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Task>(
      create: (_) => Task(),
      child: MaterialApp(
        title: "Asigname",
        debugShowCheckedModeBanner: false,
        //las rutas utilizadas estan en la carpeta routes/app_routes
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
}
