class T1 {
  final int a;

  T1(this.a);
}

class T2 extends T1 {
  final int b;

  final int c;

  T2(this.b, super.a, {required this.c});
}

void main() {
  var a = T2(1, 2, c: 6);

  // var b = T2(b, a)
}
