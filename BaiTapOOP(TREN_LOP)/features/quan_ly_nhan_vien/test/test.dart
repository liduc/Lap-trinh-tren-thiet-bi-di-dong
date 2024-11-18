import '../models/nhan_vien.dart';
import '../models/nhan_vien_ban_hang.dart';

void main() {
  // Test nhân viên thường
  var nv = NhanVien('NV001', 'Nguyễn Văn A', 5000000);
  print('Thông tin nhân viên thường:');
  nv.hienThiThongTin();

  // Test nhân viên bán hàng
  var nv_BH = NhanVienBanHang('NV002', 'Phạm Thị B', 5000000, 100000000, 0.02);
  print('\nThông tin nhân viên bán hàng:');
  nv_BH.hienThiThongTin();

  // Test setter
  nv_BH.doanhSo = 150000000;
  print('\nSau khi tăng doanh số:');
  nv_BH.hienThiThongTin();

  // Test tính đa hình
  List<NhanVien> danhSachNV = [nv, nv_BH];
  print('\nHiển thị danh sách nhân viên:');
  for (var nhanVien in danhSachNV) {
    nhanVien.hienThiThongTin();
    print('');
  }
}
