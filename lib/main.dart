import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/theme/theme_bloc.dart';
import 'package:todo_app/screens/home_screen.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  // Widget build(BuildContext context) {
  //   return BlocProvider<ThemeBloc>(
  //     create: (context) => ThemeBloc(),
  //     child: BlocBuilder<ThemeBloc, ThemeState>(
  //       builder: (context, state) {
  //         return MaterialApp(
  //           title: 'Todo Bloc App',
  //           debugShowCheckedModeBanner: false,
  //           theme: state.appTheme == AppTheme.light
  //               ? ThemeData.light()
  //               : ThemeData.dark(),
  //           home: const HomeScreen(),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Todo Bloc App',
          debugShowCheckedModeBanner: false,
          theme: context.watch<ThemeBloc>().state.appTheme == AppTheme.light
              ? ThemeData.light()
              : ThemeData.dark(),
          home: const HomeScreen(),
        );
      }),
    );
  }

  //Using The Context Extension Method. The bloc-builder is the same as the combination of using the Builder widget and the context extension
}
