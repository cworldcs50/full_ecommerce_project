String? validatePassword(String password) {
  if (password.isEmpty) {
    return "51";
  } else if (password.length < 8) {
    return "52";
  } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
    return "53";
  } else if (!RegExp(r'[0-9]').hasMatch(password)) {
    return "54";
  } else if (!RegExp(r'[!@#\$&*~]').hasMatch(password)) {
    return "55";
  }
  return null;
}
