import 'package:bloc_project/bloc/api_bloc.dart';
import 'package:bloc_project/bloc/api_event.dart';
import 'package:bloc_project/bloc/update_bloc.dart';
import 'package:bloc_project/screens/user_screen.dart';
import 'package:bloc_project/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ApiBloc()..add(GetApiList())),
        BlocProvider( create: (context) => UpdateBloc(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white, background: Colors.white),
          useMaterial3: true,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
