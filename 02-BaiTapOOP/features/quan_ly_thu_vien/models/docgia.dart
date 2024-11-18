import 'sach.dart';

class DocGia {
  String _maDocGia;
  String _hoTen;
  List<Sach> _danhSachMuon = [];

  DocGia(this._maDocGia, this._hoTen);

  // Getter
  String get maDocGia => _maDocGia;
  String get hoTen => _hoTen;
  List<Sach> get danhSachMuon => _danhSachMuon;

  // Setter
  set maDocGia(String maDocGia) {
    if (_maDocGia.isEmpty) {
      print('Ma doc gia khong duoc rong!');
    }
    if (_maDocGia.isNotEmpty) {
      _maDocGia = maDocGia;
    }
  }

  set hoTen(String hoTen) {
    if (_hoTen.isEmpty) {
      print('Ho ten khong duoc rong!');
    }
    if (_hoTen.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  // Borrow book method
  void muonSach(Sach sach) {
    if (sach.trangThaiMuon) {
      print("Sách đã có người mượn!");
    } else {
      _danhSachMuon.add(sach);
      sach.trangThaiMuon = true;
      print("Mượn sách thành công!");
    }
  }

  // Return book method
  void traSach(Sach sach) {
    if (_danhSachMuon.contains(sach)) {
      _danhSachMuon.remove(sach);
      sach.trangThaiMuon = false;
      print("Trả sách thành công!");
    } else {
      print("Sách này không nằm trong danh sách mượn!");
    }
  }
}
