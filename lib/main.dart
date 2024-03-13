import 'package:fadillah_wahyu_heryanto_frontend/controllers/list_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final userC = Get.put(ListBarangC());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppPages.pages,
    );
  }
}
