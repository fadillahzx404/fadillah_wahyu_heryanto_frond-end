import 'package:fadillah_wahyu_heryanto_frontend/components/item_card_details.dart';
import 'package:fadillah_wahyu_heryanto_frontend/controllers/list_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/models/barang_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BottomSheetController extends GetxController {
  void openBottomSheet(barang) {
    final barangC = Get.find<ListBarangC>();

    final Barang barangs = barang;
    NumberFormat numberFormat = NumberFormat.decimalPattern('id_ID');
    Get.bottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      ignoreSafeArea: false,
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Container(
                height: 6,
                width: 120,
                decoration: BoxDecoration(
                  color: Color(0xffE2E8F0),
                  borderRadius: BorderRadius.circular(90),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Image.asset(
                      'assets/images/image-empty.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xffE2E8F0),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        children: [
                          ItemCardDetails(
                            titleItem: "Nama Barang",
                            amountItem: "${barangs.nama_barang}",
                          ),
                          Divider(
                            color: Color(0xffCBD5E0),
                            thickness: 2,
                          ),
                          ItemCardDetails(
                            titleItem: 'Kategori',
                            amountItem: '${barangs.nama_kategori}',
                          ),
                          Divider(
                            color: Color(0xffCBD5E0),
                            thickness: 2,
                          ),
                          ItemCardDetails(
                            titleItem: 'Kelompok',
                            amountItem: '${barangs.kelompok_barang}',
                          ),
                          Divider(
                            color: Color(0xffCBD5E0),
                            thickness: 2,
                          ),
                          ItemCardDetails(
                            titleItem: 'Stok',
                            amountItem: '${barangs.stok}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffF1F4F9),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Harga',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Rp. ${numberFormat.format(barangs.harga)}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                          side: BorderSide(
                            color: Color(0xffE2E8F0),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        barangC.deleteBarangC(barangs.id);
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
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xff001767),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () =>
                          Get.toNamed('/editbarang', arguments: barangs.id),
                      child: Text(
                        'Edit Barang',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
