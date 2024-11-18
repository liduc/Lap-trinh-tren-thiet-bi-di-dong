import '../models/sinh_vien.dart';
import '../models/lop_hoc.dart';

//Test
void main() {
  var sv = Sinhvien('Nguyen Van A', 20, 'SV001', 8.5);
  print('Test getter: ${sv.hoTen}');
  sv.hoTen = 'Nguyen Van B';
  print('Sau khi setter: ${sv.hoTen}');
  print('Xep loai: ${sv.xepLoai()}');

  var lop = LopHoc('21DTHD5');
  lop.themSinhVien(Sinhvien('Nguyen Van A', 20, 'SV001', 8.5));
  lop.themSinhVien(Sinhvien('Nguyen Van B', 21, 'SV002', 7.0));
  lop.themSinhVien(Sinhvien('Nguyen Van C', 21, 'SV003', 7.4));
  lop.themSinhVien(Sinhvien('Nguyen Van D', 20, 'SV004', 5.5));
  lop.hienThiDanhSach();
}
