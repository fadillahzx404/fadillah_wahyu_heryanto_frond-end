import 'package:fadillah_wahyu_heryanto_frontend/components/card_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/components/search_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/controllers/list_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/providers/barang_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListStokBarang extends StatefulWidget {
  const ListStokBarang({super.key});

  @override
  State<ListStokBarang> createState() => _ListStokBarangState();
}

class _ListStokBarangState extends State<ListStokBarang> {
  final barangP = Get.put(BarangProvider());
  final barangC = Get.find<ListBarangC>();

  var onChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            );
          },
        ),
        title: const Text(
          'List Stok Barang',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.black38,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () => Get.to(SearchBarang()),
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => barangC.barangs.isEmpty
                    ? Text('Barang Belum Ada.')
                    : Text('${barangC.barangs.length} Data ditampilkan')),
                Obx(
                  () => barangC.isVisible.value == true
                      ? TextButton(
                          onPressed: () => barangC.isVisible.value =
                              !barangC.isVisible.value,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            minimumSize: Size.zero,
                          ),
                          child: Text(
                            'Edit Data',
                            style: TextStyle(
                                color: Color(0xff2F80ED),
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      : TextButton(onPressed: () {}, child: Text('')),
                ),
              ],
            ),
            Obx(() => barangC.barangs.isEmpty
                ? Text('Barang Belum Ada.')
                : Expanded(
                    child: ListView.builder(
                        itemCount: barangC.barangs.length,
                        itemBuilder: (context, index) {
                          final barang = barangC.barangs[index];

                          return CardBarang(barang);
                        }),
                  ))
          ],
        ),
      ),
      floatingActionButton: Obx(() => barangC.isVisible.value
          ? FloatingActionButton.extended(
              onPressed: () => Get.toNamed('/tambahbarang'),
              backgroundColor: const Color(0xff001767),
              label: const Text(
                'Barang',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36)),
            )
          : Text('')),
      bottomNavigationBar: Obx(
        () => barangC.isVisible.value
            ? Text('')
            : BottomAppBar(
                color: Colors.white,
                shape: CircularNotchedRectangle(),
                child: Container(
                  height: 24,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.blue.shade900,
                              value: barangC.isCheckedAll.value,
                              onChanged: (bool? value) {
                                setState(() {
                                  barangC.isCheckedAll.value =
                                      !barangC.isCheckedAll.value;
                                });
                              },
                            ),
                            Text(
                              'Pilih Semua',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                              side: BorderSide(
                                color: Color(0xffE2E8F0),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {
                            if (barangC.isCheckedAll.value == true) {
                              barangC.deleteBarangCAll();
                            } else {
                              barangC.deleteBarangCSelect();
                            }
                          },
                          child: Text(
                            'Hapus Barang',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFF463D),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () =>
                            barangC.isVisible.value = !barangC.isVisible.value,
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
