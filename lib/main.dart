import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gemini_click/features/home/bloc/home_bloc.dart';
import 'package:gemini_click/features/home/presentation/home_page.dart';

void main() {
  const String api = String.fromEnvironment("GEMINI_KEY");
  Gemini.init(apiKey: api, enableDebugging: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/home",
      routes: {
        "/home":
            (_) => BlocProvider(create: (_) => HomeBloc(), child: HomePage()),
      },
    );
  }
}
