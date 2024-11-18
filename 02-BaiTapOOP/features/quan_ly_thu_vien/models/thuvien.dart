import '../models/sach.dart';
import '../models/docgia.dart';

class ThuVien {
  List<Sach> _danhSachSach = [];
  List<DocGia> _danhSachDocGia = [];
  // Getter
  List<Sach> get danhSachSach => _danhSachSach;
  List<DocGia> get danhSachDocGia => _danhSachDocGia;

  // Add book
  void themSach(Sach sach) {
    _danhSachSach.add(sach);
    print("Thêm sách thành công!");
  }

  // Add reader
  void themDocGia(DocGia docGia) {
    _danhSachDocGia.add(docGia);
    print("Thêm độc giả thành công!");
  }

  // Display books
  void hienThiDanhSachSach() {
    print("Danh sách sách trong thư viện:");
    for (var sach in _danhSachSach) {
      sach.hienthiThongTin();
      print("------------");
    }
  }
}
