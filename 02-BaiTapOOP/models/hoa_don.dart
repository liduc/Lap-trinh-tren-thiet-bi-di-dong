import '../models/dien_thoai.dart';

class HoaDon {
  static int _soThuTu = 1; // Tu dong tao ma hoa don
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  //constructor
  HoaDon(this._maHoaDon, this._ngayBan, this._dienThoai, this._soLuongMua,
      this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhach);

  //getters
  String get maHoaDon => _maHoaDon;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoai => _dienThoai;
  int get soLuongMua => _soLuongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKhachHang => _tenKhachHang;
  String get soDienThoai => _soDienThoaiKhach;

  //Setters
  set maHoaDon(String maHoaDon) {
    _maHoaDon = _generateMaHoaDon();
  }

  // Tao ma hoa don tu dong
  static String _generateMaHoaDon() {
    String ma = "HD${_soThuTu.toString().padLeft(3, '0')}"; // HD001, HD002...
    _soThuTu++;
    return ma;
  }

  set ngayBan(DateTime ngayBan) {
    _ngayBan = DateTime.now();
  }

  set dienThoai(DienThoai dienThoai) {
    _dienThoai = dienThoai;
  }

  set soLuongMua(int soLuongMua) {
    if (soLuongMua <= 0 || soLuongMua > dienThoai.soLuongTonKho) {
      throw ArgumentError("So luong mua khong hop le");
    }
  }

  // Tinh gia tien hien tai
  double tinhTongTien() => _giaBanThucTe * _soLuongMua;

  void hienthiThongTin() {
    print('Ma hoa don: $_maHoaDon');
    print('Ngay ban: $_ngayBan');
    print('Ten khach hang: $_tenKhachHang');
    print('So dien thoai: $_soDienThoaiKhach');
    print('Ten dien thoai: $_dienThoai');
    print('So luong:: $_soLuongMua');
    print('Gia: $_giaBanThucTe');
  }
}
