class StringUtil {
  static  String removeFirstSlash(String input) {
    if (input.startsWith('/')) {
      return input.substring(1); // Remove the first character
    }
    return input; // Return as-is if there's no leading slash
  }
}