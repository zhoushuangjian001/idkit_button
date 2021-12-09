void main() {
  var a = 'https xxxxx';
  var b = a.startsWith(RegExp(r'http://|https://|http|https'));
  print(b);
}
