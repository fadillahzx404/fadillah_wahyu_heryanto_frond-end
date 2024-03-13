import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditBarangC extends GetxController {
  late TextEditingController namaController;
  late TextEditingController stokController;
  late TextEditingController hargaController;
  var kategoriController;
  var kelompokController;

  @override
  void onInit() {
    super.onInit();

    namaController = TextEditingController();
    kategoriController = ''.obs;
    stokController = TextEditingController();
    hargaController = TextEditingController();
    kelompokController = ''.obs;
  }

  @override
  void onClose() {
    namaController.dispose();
    stokController.dispose();
    hargaController.dispose();
    super.onClose();
  }
}
