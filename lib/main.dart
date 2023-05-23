import 'package:amazon_clone/app/resources/color_manager.dart';
import 'package:amazon_clone/app/routes/router.dart';
import 'package:amazon_clone/features/auth/presentation/pages/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorManager.backgroundColor,
        colorScheme:
            const ColorScheme.light(primary: ColorManager.motoSecondaryColor),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          //FISSA IL COLORE DELLE ICONE A NERO ANCHE SE CAMBIO LO SFONDO
          iconTheme: IconThemeData(color: Colors.black),
        ),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      // home: const NotFound404Error(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello"),
        ),
        body: Center(
          child: Column(
            children: [
              const Text("Flutter Demo Home Page"),
              Builder(builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AuthScreen.routeName);
                  },
                  child: const Text("Click"),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
