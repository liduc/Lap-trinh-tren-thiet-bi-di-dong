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
