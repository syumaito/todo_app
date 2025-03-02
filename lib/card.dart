import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {

  final String title;
  final int index;
  final VoidCallback onPressedComplete;
  final VoidCallback onPressedDelete;

  const TodoCard({
    super.key,
    required this.title,
    required this.index,
    required this.onPressedComplete,
    required this.onPressedDelete
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextField(), //期限入力するUIつくる
          ListTile(title: Text(title)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  onPressedComplete; //完了タップ時の処理変更する(保存)、今は削除する処理になってる
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.blue),
                ),
                child: const Text("完了"),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () {
                  onPressedDelete;
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
}