// Lop SinhVien
class Sinhvien {
  String _hoTen;
  int _tuoi;
  String _maSV;
  double _diemTB;
// constructor
  Sinhvien(this._hoTen, this._tuoi, this._maSV, this._diemTB);

  //Getters
  String get hoTen => _hoTen;
  int get tuoi => _tuoi;
  String get maSV => _maSV;
  double get diemTB => _diemTB;
  //Setters
  set hoTen(String hoTen) {
    if (_hoTen.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  set tuoi(int tuoi) {
    if (tuoi > 0) {
      _tuoi = tuoi;
    }
  }

  set maSV(String maSV) {
    if (_maSV.isNotEmpty) {
      _maSV = maSV;
    }
  }

  set diemTB(double diemTB) {
    if (diemTB >= 0 && diemTB <= 10) {
      _diemTB = diemTB;
    }
  }

  void hienthiThongTin() {
    print('Ho ten: $_hoTen');
    print('Tuoi: $tuoi');
    print('MSSV: $maSV');
    print('Diem TB: $diemTB');
  }

  String xepLoai() {
    if (_diemTB >= 8.0) return 'Gioi';
    if (_diemTB >= 6.5) return 'Kha';
    if (_diemTB >= 5.0) return 'Trung binh';
    return 'Yeu';
  }
}

//Lop LopHoc
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
