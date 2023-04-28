import 'package:flutter/material.dart';
import 'bool_test.dart';

class StringCheckScreen extends StatefulWidget {
  @override
  _StringCheckScreenState createState() => _StringCheckScreenState();
}

class _StringCheckScreenState extends State<StringCheckScreen> {
  final _controller = TextEditingController();
  String _input = '';

  String _getResult() {
    if (isLowerCyrillic(_input)) {
      return 'Стрічка містить тільки нижній регістр кирицилі';
    } else if (isUpperCyrillic(_input)) {
      return 'Стрічка містить тільки верхній регістр кирилиці';
    } else if (isUpperLatin(_input)) {
      return 'Стрічка містить тільки верхній регістр латиниці';
    } else if (Individualsymbols(_input)) {
      return 'Стрічка містить тільки окремі символи []];\/';
    } else if (isStrongPassword(_input)) {
      return 'Пароль надійний та задоволняє потреби до стійкості';
    } else {
      return 'Стрічка не задовольняє жодному з вимог';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('String Check'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "PASSWORD"),
              onChanged: (value) {
                setState(() {
                  _input = value;
                });
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Result'),
                    content: Text(_getResult()),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Check'),
          ),
        ],
      ),
    );
  }
}
