import 'package:fadillah_wahyu_heryanto_frontend/controllers/bottomsheet_controller.dart';
import 'package:fadillah_wahyu_heryanto_frontend/controllers/list_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/models/barang_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CardBarang extends StatefulWidget {
  final Barang barang;
  CardBarang(this.barang, {super.key});

  @override
  State<CardBarang> createState() => _CardBarangState();
}

class _CardBarangState extends State<CardBarang> {
  final barangC = Get.find<ListBarangC>();
  bool isChecked = false;
  NumberFormat numberFormat = NumberFormat.decimalPattern('id_ID');
  final bottomSheetC = Get.put(BottomSheetController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => bottomSheetC.openBottomSheet(widget.barang),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => barangC.isVisible.value
                          ? Text('')
                          : Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: SizedBox(
                                height: 24.0,
                                width: 24.0,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.blue.shade900,
                                  value: barangC.isCheckedAll.value == true
                                      ? barangC.isCheckedAll.value
                                      : isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (barangC.isCheckedAll.value == false) {
                                        isChecked = value!;
                                      } else {}

                                      value == true
                                          ? barangC.arrayDel
                                              .add(widget.barang.id)
                                          : barangC.arrayDel.removeWhere(
                                              (e) => e == widget.barang.id);
                                    });
                                  },
                                ),
                              ),
                            ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.barang.nama_barang}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff202327),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Stok: ${widget.barang.stok}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff68778D),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "Rp. ${numberFormat.format(widget.barang.harga)}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff202327),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
