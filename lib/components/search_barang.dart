import 'package:fadillah_wahyu_heryanto_frontend/components/card_barang_cari.dart';
import 'package:fadillah_wahyu_heryanto_frontend/controllers/list_barang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarang extends StatelessWidget {
  SearchBarang({super.key});

  final barangC = Get.find<ListBarangC>();
  final barangCC = Get.put(ListBarangC());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            );
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: TextField(
            autofocus: true,
            onChanged: (value) => barangC.searchBarang(value),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff68778D),
              ),
              filled: true,
              fillColor: Color(0xffF1F4F9),
              focusColor: Color(0xffF1F4F9),
              hintText: 'Cari data...',
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(
                  color: Color(0xffF1F4F9),
                  width: 0.0,
                ),
              ),
            ),
          ),
        ),
        titleSpacing: -1,
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.black38,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  barangC.searchQuery == ""
                      ? 'Anda Belum Mencari Barang'
                      : '${barangC.findBarangs.length} Data Cocok',
                  style: TextStyle(
                    color: Color(0xff68778D),
                  ),
                ),
              ),
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: barangC.findBarangs.length,
                  itemBuilder: (context, index) {
                    final barang = barangC.findBarangs[index];
                    return CardBarangCari(barang);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
