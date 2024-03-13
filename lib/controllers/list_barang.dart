import 'dart:convert';

import 'package:fadillah_wahyu_heryanto_frontend/models/barang_model.dart';
import 'package:fadillah_wahyu_heryanto_frontend/providers/barang_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListBarangC extends GetxController {
  var barangs = <dynamic>[].obs;
  var categories = <dynamic>[].obs;
  var findBarangs = <dynamic>[].obs;

  var searchQuery = ''.obs;

  var isVisible = true.obs;

  var isChecked = false.obs;
  var isCheckedAll = false.obs;

  var arrayDel = [].obs;

  @override
  void onInit() {
    fetchBarangs();
    getKategori();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  final String serverUrl = 'http://localhost:8000';

  Future<void> fetchBarangs() async {
    try {
      var response = await http.get(Uri.parse("$serverUrl/api/barang"));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        findBarangs.value = data.map((item) => Barang.fromJson(item)).toList();
        barangs.value = data.map((item) => Barang.fromJson(item)).toList();
      } else {
        throw Exception('Gagal Mendapatakan Barang');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getKategori() async {
    try {
      var response = await http.get(Uri.parse("$serverUrl/api/kategori"));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        categories.value = data;
        print(categories);
      } else {
        throw Exception('Gagal Mendapkan Kategori');
      }
    } catch (e) {
      print(e);
    }
  }

  void searchBarang(String query) async {
    searchQuery.value = query;
    if (query.isEmpty) {
      findBarangs.value = barangs.toList(); // Menampilkan semua data
    } else {
      print(query);
      var filteredData = findBarangs
          .toList()
          .where((item) => item.nama_barang
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();

      findBarangs.value = filteredData;
      print(filteredData);
    }
  }

  void snackBarError(String msg) {
    Get.snackbar(
      "ERROR",
      msg,
      duration: const Duration(seconds: 2),
    );
  }

  void snackBarSuccess(String msg) {
    Get.snackbar(
      "Success",
      msg,
      duration: const Duration(seconds: 2),
    );
  }

  void add(String namaBarang, String kategoriBarang, String kelompokBarang,
      String stokBarang, String hargaBarang) {
    if (namaBarang != '' &&
        kelompokBarang != '' &&
        kategoriBarang != '' &&
        stokBarang != '' &&
        hargaBarang != '') {
      BarangProvider()
          .addBarang(namaBarang, int.parse(kategoriBarang), kelompokBarang,
              stokBarang, hargaBarang)
          .then((response) {
        var barangId = int.parse(response.body['idB']);

        barangs.add(Barang(
          id: barangId,
          kategori_id: int.parse(kategoriBarang),
          nama_barang: namaBarang,
          kelompok_barang: kelompokBarang,
          stok: int.parse(stokBarang),
          harga: int.parse(hargaBarang),
        ));
      });

      Get.back();
      snackBarSuccess("Data Ditambahkan.");
    } else {
      snackBarError("Semua data harus diisi");
    }
  }

  Future<bool> deleteBarangC(int? id) async {
    bool _deleted = false;
    await Get.dialog(Dialog(
        backgroundColor: Colors.grey,
        child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Text(
                      "Yakin? Ingin Menghapus",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () {
                                  BarangProvider().deleteBarang(id).then((_) {
                                    barangs.removeWhere((e) => e.id == id);
                                    _deleted = true;
                                  });

                                  Get.back();
                                  Get.back();
                                  snackBarSuccess("Data Dihapus.");
                                },
                                child: Text(
                                  'Iya',
                                  style: TextStyle(color: Colors.white),
                                ))),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow,
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'Tidak',
                                  style: TextStyle(color: Colors.black),
                                )))
                      ],
                    ),
                  )
                ]))));
    return _deleted;
  }

  Future<bool> deleteBarangCAll() async {
    bool _deletedAll = false;

    await Get.dialog(Dialog(
        backgroundColor: Colors.grey,
        child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Text(
                      "Yakin Ingin Menghapus Semua Barang ?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () {
                                  BarangProvider().deleteAllBarang().then((_) {
                                    barangs.clear();
                                    _deletedAll = true;
                                  });
                                  Get.back();
                                  snackBarSuccess(
                                      "Sukses Semua Data Di Hapus.");
                                },
                                child: Text(
                                  'Iya',
                                  style: TextStyle(color: Colors.white),
                                ))),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow,
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'Tidak',
                                  style: TextStyle(color: Colors.black),
                                )))
                      ],
                    ),
                  )
                ]))));

    return _deletedAll;
  }

  Future<bool> deleteBarangCSelect() async {
    bool _deletedAll = false;

    await Get.dialog(Dialog(
        backgroundColor: Colors.grey,
        child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Text(
                      "Yakin Ingin Menghapus Barang Yang Di Pilih",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () {
                                  BarangProvider()
                                      .deleteSelectedBarang(arrayDel)
                                      .then((_) {
                                    for (var e in arrayDel) {
                                      barangs.removeWhere(
                                          (element) => element.id == e);
                                    }
                                    _deletedAll = true;
                                    Get.back();
                                    snackBarSuccess(
                                        "Data Yang Dipilih Telah Di Hapus.");
                                  });
                                },
                                child: Text(
                                  'Iya',
                                  style: TextStyle(color: Colors.white),
                                ))),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow,
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'Tidak',
                                  style: TextStyle(color: Colors.black),
                                )))
                      ],
                    ),
                  )
                ]))));

    return _deletedAll;
  }

  Barang barangById(int id) {
    return barangs.firstWhere((element) => element.id == id);
  }

  void updateBarang(int id, String namaBarang, String kategoriBarang,
      String kelompokBarang, String stokBarang, String hargaBarang) {
    if (namaBarang != '' &&
        kelompokBarang != '' &&
        stokBarang != '' &&
        hargaBarang != '' &&
        kategoriBarang != '') {
      BarangProvider().updateBarang(id, namaBarang, int.parse(kategoriBarang),
          kelompokBarang, int.parse(stokBarang), int.parse(hargaBarang));
      final barang = barangById(id);
      barang.nama_barang = namaBarang;
      barang.kelompok_barang = kelompokBarang;
      barang.stok = int.parse(stokBarang);
      barang.harga = int.parse(hargaBarang);
      barang.kategori_id = int.parse(kategoriBarang);
      barangs.refresh();
      Get.back();
    } else {
      snackBarError("Semua data harus diisi");
    }
  }
}
