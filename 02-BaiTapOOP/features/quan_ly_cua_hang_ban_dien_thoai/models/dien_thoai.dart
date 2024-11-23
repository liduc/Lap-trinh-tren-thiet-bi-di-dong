class DienThoai {
  String _maDT;
  String _tenDT;
  String _hangSX;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai;

  //constructor
  DienThoai(this._maDT, this._tenDT, this._hangSX, this._giaNhap, this._giaBan,
      this._soLuongTonKho, this._trangThai);

  //Getters
  String get maDT => _maDT;
  String get tenDT => _tenDT;
  String get hangSX => _hangSX;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTonKho => _soLuongTonKho;
  bool get trangThai => _trangThai;

  //Setters
  set maDT(String maDT) {
    if (_maDT.isEmpty) {
      print('Khong duoc de rong!');
    } else {
      _maDT = maDT;
    }
  }

  set tenDT(String tenDT) {
    if (_tenDT.isEmpty) {
      print('Khong duoc de rong!');
    } else {
      _tenDT = tenDT;
    }
  }

  set hangSX(String hangSX) {
    if (_hangSX.isEmpty) {
      print('Khong duoc de rong!');
    } else {
      _hangSX = hangSX;
    }
  }

  set giaNhap(double giaNhap) {
    if (_giaNhap < 0) {
      print('Khong duoc de so am!');
    } else {
      _giaNhap = giaNhap;
    }
  }

  set giaBan(double giaBan) {
    if (giaBan > 0 && giaBan < giaNhap) {
      _giaBan = giaBan;
    }
  }

  set soLuongTonKho(int soLuongTonKho) {
    if (soLuongTonKho >= 0) {
      _soLuongTonKho = soLuongTonKho;
    }
  }

  set trangThai(bool trangThai) {
    _trangThai = trangThai;
  }

  // Kiem tra co the ban khong
  bool coTheBan() => _trangThai && _soLuongTonKho > 0;

  // Tinh loi nhuan du kien
  double tinhLoiNhuanDuKien() => (_giaBan - _giaNhap) * _soLuongTonKho;

  void hienThiThongTin() {
    print('Ma dien thoai: $_maDT');
    print('Ten dien thoai: $_tenDT');
    print('Hang san xuat: $_hangSX');
    print('Gia nhap: $_giaNhap');
    print('Gia ban: $_giaBan');
    print('So luong ton kho: $_soLuongTonKho');
    print('Trang thai: ${_trangThai ? "Con kinh doanh" : "Ngung kinh doanh"}');
  }
}
