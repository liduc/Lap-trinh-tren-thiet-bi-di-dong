class NhanVien {
  String _maNV;
  String _hoTen;
  double _luongCoBan;

  NhanVien(this._maNV, this._hoTen, this._luongCoBan);

  // Getters
  String get maNV => _maNV;
  String get hoTen => _hoTen;
  double get luongCoBan => _luongCoBan;

  // Setters
  set maNV(String maNV) {
    if (maNV.isNotEmpty) {
      _maNV = maNV;
    }
  }

  set hoTen(String hoTen) {
    if (hoTen.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  set luongCoBan(double luongCoBan) {
    if (luongCoBan > 0) {
      _luongCoBan = luongCoBan;
    }
  }

  double tinhLuong() {
    return _luongCoBan;
  }

  void hienThiThongTin() {
    print('Mã NV: $_maNV');
    print('Họ tên: $_hoTen');
    print('Lương cơ bản: $_luongCoBan');
    print('Tổng lương: ${tinhLuong()}');
  }
}
