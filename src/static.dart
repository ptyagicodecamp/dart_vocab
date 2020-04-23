//Using static keyword
class StringUtils {
  static const dart = "oh dart";

  static String reverse(String str) {
    return String.fromCharCodes(str.runes.toList().reversed);
  }
}

//Example: Passing static method as constant constructor param
class SomeObj {
  final String myStr;

  const SomeObj(this.myStr);
}

//Utility method at top-level
const dart = "oh dart";

String reverse(String str) {
  return String.fromCharCodes(str.runes.toList().reversed);
}

///Tip: Avoid classes with only static members in it
///Lint rule: {https://dart-lang.github.io/linter/lints/avoid_classes_with_only_static_members.html}

void main() {
  //Using static const and method
  String reversedStatic = StringUtils.reverse(StringUtils.dart);
  print(reversedStatic);

  //Static method as constructor's parameter
  SomeObj obj = SomeObj(StringUtils.reverse(StringUtils.dart));
  print(obj.myStr);

  //Moving utility method/variable to top-level
  String reversedStr = reverse(dart);
  print(reversedStr);
}
