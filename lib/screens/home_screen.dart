import 'package:flutter/material.dart';
import 'package:todo_app/screens/components/create_todo_widget.dart';
import 'package:todo_app/screens/components/search_and_filter_todo_widget.dart';
import 'package:todo_app/screens/components/show_todo_widget.dart';
import 'package:todo_app/screens/components/todo_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          children: const [
            TodoHeader(),
            CreateTodo(),
            SizedBox(
              height: 20.0,
            ),
            SearchAndFilterTodo(),
            ShowTodo(),
          ],
        ),
      ))),
    );
  }
}
