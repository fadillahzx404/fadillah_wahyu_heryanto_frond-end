import 'package:fadillah_wahyu_heryanto_frontend/controllers/add_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/controllers/list_barang.dart';
import 'package:get/get.dart';

import '../controllers/edit_barang.dart';

class EditBB implements Bindings {
  @override
  void dependencies() {
    Get.put(ListBarangC());
    Get.put(AddBarangC());
    Get.put(EditBarangC());
  }
}
