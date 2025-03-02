import 'package:flutter/material.dart';
import 'text_area.dart';
import 'card.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Todo App", home: TextInputWidget());
  }
}

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final _controller = TextEditingController();
  List<String> todoList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(165, 190, 215, 1.0),
      appBar: AppBar(title: const Text("TodoApp")),
      body: ListView.builder(
        itemCount: todoList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == todoList.length) {
            return TextArea(
              controller: _controller,
              onPressedSubmitButton: _submitTodo,
              onSubmitted: _submitTodo,
            );
          }
          var title = todoList[index];
          return TodoCard(
            title: title,
            index: index,
            onPressedComplete: () {
              _complete(index);
            },
            onPressedDelete: () {
              _delete(index);
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _complete(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void _delete(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void _submitTodo(String title) {
    setState(() {
      if (title.isEmpty == false) {
        todoList.add(title);
        _controller.clear();
      }
    });
  }
}
