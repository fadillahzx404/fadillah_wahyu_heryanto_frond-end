import 'package:fadillah_wahyu_heryanto_frontend/models/barang_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardBarangCari extends StatefulWidget {
  final Barang barang;
  const CardBarangCari(this.barang, {super.key});

  @override
  State<CardBarangCari> createState() => _CardBarangCariState();
}

class _CardBarangCariState extends State<CardBarangCari> {
  NumberFormat numberFormat = NumberFormat.decimalPattern('id_ID');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.barang.nama_barang}',
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
                        '1',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff68778D),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${widget.barang.kelompok_barang}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff68778D),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Stok: ${widget.barang.stok}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff68778D),
                    ),
                  ),
                  SizedBox(
                    height: 8,
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
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
