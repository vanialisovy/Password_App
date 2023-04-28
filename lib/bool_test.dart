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
  final pattern = RegExp(r'^[;\[\]\\/’]*$');
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
