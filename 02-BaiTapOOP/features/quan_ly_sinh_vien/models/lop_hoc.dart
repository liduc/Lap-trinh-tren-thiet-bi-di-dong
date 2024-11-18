import '../models/sinh_vien.dart';

class LopHoc {
  String _tenLop;
  List<Sinhvien> _danhSachSV = [];

  LopHoc(this._tenLop);

  //Getters
  String get tenLop => _tenLop;
  List<Sinhvien> get danhSachSV => _danhSachSV;

  //Setters
  set tenLop(tenLop) {
    if (tenLop.isNotEmpty) {
      _tenLop = tenLop;
    }
  }

  //Them sinh vien
  void themSinhVien(Sinhvien sv) {
    _danhSachSV.add(sv);
  }

  void hienThiDanhSach() {
    print('\n----------------------------');
    print('\n----------------------------');
    print('Danh sach sinh vien lop $_tenLop');
    for (var sv in _danhSachSV) {
      print('\n----------------------------');
      sv.hienthiThongTin();
      print('\nXep loai: ${sv.xepLoai()}');
    }
  }
}
