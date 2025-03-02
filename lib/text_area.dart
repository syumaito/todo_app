import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {


  final TextEditingController controller;
  final Function(String) onPressedSubmitButton;
  final Function(String) onSubmitted;

  const TextArea({
    super.key,
    required this.controller,
    required this.onPressedSubmitButton,
    required this.onSubmitted
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: "タップして入力",
                  hintStyle: TextStyle(color: Colors.grey)),
              onChanged: (String value) {
                print(value);
              },
              onSubmitted: onSubmitted,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5.0,
            ),
            child: ElevatedButton(
              onPressed: () {
                onPressedSubmitButton(controller.text);
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
}