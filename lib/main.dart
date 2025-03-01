import 'package:flutter/material.dart';

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
            return _createTextArea();
          } else {
            var title = todoList[index];
            return _createTodoCard(title, index);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _createTodoCard(String title, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextField(),//期限入力するUIつくる
          ListTile(title: Text(title)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  _complete(index); //完了タップ時の処理変更する(保存)、今は削除する処理になってる
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.blue),
                ),
                child: const Text("完了"),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () {
                  _delete(index);
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.blue),
                ),
                child: const Text("削除"),
              ),
              const SizedBox(width: 10.0),
            ],
          ),
        ],
      ),
    );
  }

  Widget _createTextArea() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: "タップして入力",hintStyle: TextStyle(color: Colors.grey)),
              onChanged: (String value) {
                print(value);
              },
              onSubmitted: _submitTodo,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            child: ElevatedButton(
              onPressed: () {
                _submitTodo(_controller.text);
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.blue),
              ),
              child: const Text("カード追加"),
            ),
          ),
        ],
      ),
    );
  }

  void _submitTodo(String title) {
    setState(() {
      if (title.isEmpty == false) {
        todoList.add(title);
        _controller.clear();
      }
    });
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
}
