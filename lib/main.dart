import 'package:flutter/material.dart';
import 'package:todo_app/cubits/theme/theme_cubit.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Todo Bloc App',
            debugShowCheckedModeBanner: false,
            theme: state.appTheme == AppTheme.light
                ? ThemeData.light()
                : ThemeData.dark(),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
