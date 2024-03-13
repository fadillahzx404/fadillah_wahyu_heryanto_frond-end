import 'package:fadillah_wahyu_heryanto_frontend/bindings/add_barang_binding.dart';
import 'package:fadillah_wahyu_heryanto_frontend/bindings/barang_binding.dart';
import 'package:fadillah_wahyu_heryanto_frontend/bindings/edit_barang_binding.dart';
import 'package:fadillah_wahyu_heryanto_frontend/pages/edit_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/pages/list_stok_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/pages/tambah_barang.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: '/',
      page: () => ListStokBarang(),
      binding: BarangB(),
    ),
    GetPage(
      name: '/editbarang',
      page: () => EditBarang(),
      binding: EditBB(),
    ),
    GetPage(
      name: '/tambahbarang',
      page: () => TambahBarang(),
      binding: AddBarangB(),
    ),
  ];
}
