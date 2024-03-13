import 'package:fadillah_wahyu_heryanto_frontend/controllers/add_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/controllers/edit_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/controllers/list_barang.dart';
import 'package:get/get.dart';

class AddBarangB implements Bindings {
  @override
  void dependencies() {
    Get.put(ListBarangC());
    Get.put(EditBarangC());
    Get.put(AddBarangC());
  }
}
