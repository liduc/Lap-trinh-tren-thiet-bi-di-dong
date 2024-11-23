import '../models/cua_hang.dart';
import '../models/dien_thoai.dart';
import '../models/hoa_don.dart';

void main() {
  // Tao thong tin cua hang
  CuaHang cuaHang = CuaHang(
    tenCuaHang: "Cua hang dien thoai FPT",
    diaChi: "123 Duong Kha Van Can,Thanh pho Thu Duc, TP. HCM",
  );

// Quan ly dien thoai
  try {
    // Them dien thoai moi
    DienThoai dt1 =
        DienThoai("DT-001", "iPhone 14", "Apple", 20000000, 25000000, 10, true);
    DienThoai dt2 = DienThoai("DT-002", "Samsung Galaxy S23", "Samsung",
        18000000, 23000000, 15, true);

    cuaHang.themDienThoai(dt1);
    cuaHang.themDienThoai(dt2);

    // Cap nhat thong tin
    cuaHang.capNhatDienThoai("DT-001", giaBan: 26000000, soLuongTon: 8);
    cuaHang.capNhatDienThoai("DT-002", trangThai: false);

    // Hien danh sach dien thoai
    print("\n--- Danh sach dien thoai sau khi cap nhat ---");
    cuaHang.hienThiDanhSachDienThoai();

    // Kiểm tra validation
    try {
      cuaHang.themDienThoai(
          DienThoai("", "Huawei P50", "Huawei", 15000000, 20000000, 5, true));
    } catch (e) {
      print("\nLoi them dien thoai khong hop le: $e");
    }
  } catch (e) {
    print("\nLoi: $e");
  }

  //Quan ly hoa don
  try {
    // Tao hoa don
    HoaDon hoaDon1 = HoaDon(
      "HD-001",
      DateTime.now(),
      cuaHang.timKiemDienThoai(ma: "DT-001").first,
      2,
      26000000,
      "Nguyen Van A",
      "0123456789",
    );

    HoaDon hoaDon2 = HoaDon(
      "HD-002",
      DateTime.now(),
      cuaHang.timKiemDienThoai(ma: "DT-002").first,
      1,
      23000000,
      "Tran Van A",
      "0987654321",
    );

    // Hien thi danh sach hoa don
    print("\n--- Danh sach hoa don ---");
    cuaHang.hienThiDanhSachHoaDon();

    // Kiem tra rang buoc (ton kho, validation)
    try {
      HoaDon hoaDon3 = HoaDon(
        "HD-003",
        DateTime.now(),
        cuaHang.timKiemDienThoai(ma: "DT-001").first,
        20, // Vượt quá tồn kho
        26000000,
        "Nguyen Van C",
        "0123456789",
      );
      // cuaHang.taoHoaDon(hoaDon3);
    } catch (e) {
      print("\nLoi hoa don: $e");
    }
  } catch (e) {
    print("\nLoi: $e");
  }

  // Thong ke bao cao
  try {
    // Tinh doanh thu theo thoi gian
    DateTime tuNgay = DateTime.now().subtract(Duration(days: 7));
    DateTime denNgay = DateTime.now();

    double doanhThu = cuaHang.tinhTongDoanhThu(tuNgay, denNgay);
    print(
        "\n--- Doanh thu tu ${tuNgay.toString()} den ${denNgay.toString()}: $doanhThu VND");

    // Bao cao ton kho
    print("\n--- Thong ke ton kho ---");
    cuaHang.thongKeTonKho();
  } catch (e) {
    print("\nLoi: $e");
  }
}
