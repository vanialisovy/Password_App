import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextFieldScreen(),
    );
  }
}

class TextFieldScreen extends StatefulWidget {
  @override
  _TextFieldScreenState createState() {
    return _TextFieldScreenState();
  }
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  final _controller_password = TextEditingController();
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 216, 223, 196),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        title: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StringCheckScreen()),
            );
          },
          icon: Row(
            children: [Icon(Icons.window, size: 50)],
          ),
          iconSize: 50,
          padding: EdgeInsets.all(15),
          color: Color.fromARGB(255, 219, 178, 131),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            child: TextField(
              style: TextStyle(
                  fontSize: 23, color: Color.fromARGB(255, 86, 24, 152)),
              controller: _controller_password,
              decoration: InputDecoration(
                  hintText: "Input Password",
                  hintStyle: TextStyle(fontSize: 20),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                      borderRadius: BorderRadius.circular(30)),
                  fillColor: Color.fromARGB(151, 120, 120, 120),
                  filled: true),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    password = _controller_password.text;
                    test('Нижній регістр', () {
                      expect(isUpperCyrillic(password), true);
                    });
                  });
                },
                child: Text("Кирилиця великі"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(100, 220, 242, 112)),
                    fixedSize: MaterialStateProperty.all(Size(150, 60))),
              ),
              SizedBox(
                height: 20,
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    password = _controller_password.text;
                    test('Кирилиця маленькі', () {
                      expect(isLowerCyrillic(password), true);
                    });
                  });
                },
                child: Text(
                  "Кирилиця маленькі ",
                  textAlign: TextAlign.center,
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(100, 197, 122, 116)),
                    fixedSize: MaterialStateProperty.all(Size(150, 60))),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    password = _controller_password.text;
                    test('Латинські великі ', () {
                      expect(isUpperLatin(password), true);
                    });
                  });
                },
                child: Text("Латинські великі "),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(100, 122, 207, 204)),
                    fixedSize: MaterialStateProperty.all(Size(150, 60))),
              ),
              SizedBox(
                height: 15,
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    password = _controller_password.text;
                    test('Індивідуальні символи', () {
                      expect(Individualsymbols(password), true);
                    });
                  });
                },
                child: Text(
                  "Індивідуальні символи",
                  textAlign: TextAlign.center,
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 238, 129, 138)),
                    fixedSize: MaterialStateProperty.all(Size(150, 60))),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                password = _controller_password.text;
                test('Перевірка надійності', () {
                  expect(isStrongPassword(password), true);
                });
              });
            },
            child: Text("Перевірка надійності"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(98, 234, 136, 193)),
                fixedSize: MaterialStateProperty.all(Size(250, 50))),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _controller_password.clear();
                password = '';
              });
            },
            child: Text("CLEAR ALL"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 183, 179, 179)),
                fixedSize: MaterialStateProperty.all(Size(250, 50))),
          ),
          SizedBox(
            height: 20,
          ),
          Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Password.svg/1200px-Password.svg.png",
            height: 180,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Виконав:\nЛісовий Іван Вадимович",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontStyle: FontStyle.italic),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

bool isLowerCyrillic(String password) {
  final pattern = RegExp(r'^[а-яєіїґ]*$');
  return pattern.hasMatch(password);
}

bool isUpperCyrillic(String password) {
  final pattern = RegExp(r'^[А-ЯЄІЇҐ]*$');
  return pattern.hasMatch(password);
}

bool isUpperLatin(String password) {
  final pattern = RegExp(r'^[A-Z]*$');
  return pattern.hasMatch(password);
}

bool Individualsymbols(String password) {
  final pattern = RegExp(r'[\[\];’\\/]');
  return pattern.hasMatch(password);
}

bool isStrongPassword(String password) {
  final lowerCyrillicRegex = RegExp(r'[а-я]');
  final upperCyrillicRegex = RegExp(r'[А-Я]');
  final upperLatinRegex = RegExp(r'[A-Z]');
  final specialCharsRegex = RegExp(r'[\[\];’\\/]');

  final hasMinLength = password.length >= 10;
  final hasLowerCyrillic = lowerCyrillicRegex.allMatches(password).length >= 3;
  final hasUpperCyrillic = upperCyrillicRegex.allMatches(password).length >= 3;
  final hasUpperLatin = upperLatinRegex.allMatches(password).length >= 3;
  final hasSpecialChars = specialCharsRegex.allMatches(password).length >= 3;

  return hasMinLength &&
      hasLowerCyrillic &&
      hasUpperCyrillic &&
      hasUpperLatin &&
      hasSpecialChars;
}

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
