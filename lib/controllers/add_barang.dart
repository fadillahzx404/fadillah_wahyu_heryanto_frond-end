import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBarangC extends GetxController {
  late TextEditingController namaController;
  late TextEditingController stokController;
  late TextEditingController hargaController;
  var kategoriController;
  var kelompokController;

  @override
  void onInit() {
    super.onInit();

    namaController = TextEditingController();
    kelompokController = ''.obs;
    stokController = TextEditingController();
    hargaController = TextEditingController();
    kategoriController = ''.obs;
  }

  @override
  void onClose() {
    namaController.dispose();
    stokController.dispose();
    hargaController.dispose();
    super.onClose();
  }
}
