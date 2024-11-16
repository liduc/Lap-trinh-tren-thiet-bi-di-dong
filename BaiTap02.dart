import 'dart:io';
import 'dart:math';

//BaiTap02.dart
//Giai pt bac 2: ax^2+bx+c = 0;
void main() {
  // Hàm để người dùng nhập số thực
  double readDouble(String prompt, {bool nonZero = false}) {
    while (true) {
      stdout.write(prompt);
      String? input = stdin.readLineSync();
      double? value = double.tryParse(input ?? '');
      if (value == null) {
        print('Lỗi: Vui lòng nhập một số thực!');
      } else if (nonZero && value == 0) {
        print('Lỗi: Giá trị phải khác 0!');
      } else {
        return value;
      }
    }
  }

  // Nhập hệ số a (a != 0)
  double a = readDouble('Nhập hệ số a (a != 0): ', nonZero: true);

  // Nhập hệ số b
  double b = readDouble('Nhập hệ số b: ');

  // Nhập hệ số c
  double c = readDouble('Nhập hệ số c: ');

  // Tính delta (b^2 - 4ac)
  double delta = b * b - 4 * a * c;

  // Giải phương trình
  if (delta < 0) {
    print('Phương trình vô nghiệm.');
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print('Phương trình có nghiệm kép: x = $x');
  } else {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print('Phương trình có hai nghiệm phân biệt:');
    print('x1 = $x1');
    print('x2 = $x2');
  }
}
