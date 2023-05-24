import 'package:amazon_clone/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/services/service_locator.dart';
import '../features/auth/presentation/pages/auth_screen.dart';
import 'resources/color_manager.dart';
import 'routes/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
        )
      ],
      child: MaterialApp(
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
        home: const AuthScreen(),
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: const Text("Hello"),
        //   ),
        //   body: Center(
        //     child: Column(
        //       children: [
        //         const Text("Flutter Demo Home Page"),
        //         Builder(builder: (context) {
        //           return ElevatedButton(
        //             onPressed: () {
        //               Navigator.pushNamed(context, AuthScreen.routeName);
        //             },
        //             child: const Text("Click"),
        //           );
        //         })
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
