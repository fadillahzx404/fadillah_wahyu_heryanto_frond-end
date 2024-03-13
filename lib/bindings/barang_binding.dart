import 'package:fadillah_wahyu_heryanto_frontend/controllers/add_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/controllers/edit_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/controllers/list_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/providers/barang_providers.dart';
import 'package:get/get.dart';

class BarangB implements Bindings {
  @override
  void dependencies() {
    Get.put(ListBarangC());
    Get.put(AddBarangC());
    Get.put(EditBarangC());
    Get.put(BarangProvider());
  }
}
