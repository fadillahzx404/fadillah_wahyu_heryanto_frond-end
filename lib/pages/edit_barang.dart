import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fadillah_wahyu_heryanto_frontend/components/inputfield.dart';
import 'package:fadillah_wahyu_heryanto_frontend/controllers/edit_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/controllers/list_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/models/barang_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<String> listKelompok = <String>["one", "two", "three", "four"];

class EditBarang extends StatefulWidget {
  const EditBarang({super.key});

  @override
  State<EditBarang> createState() => _EditBarangState();
}

class _EditBarangState extends State<EditBarang> {
  final editC = Get.find<EditBarangC>();
  final catC = Get.find<ListBarangC>();
  final barangC = Get.find<ListBarangC>();

  final formValid = RxBool(false);

  final _formKey = GlobalKey<FormState>();

  final int idBarang = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final Barang barang = barangC.barangById(idBarang);
    String? dropdownValue = barang.kelompok_barang;
    String? dropdownValueKategori = barang.kategori_id.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Barang',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.black38,
        titleSpacing: -1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                InputField(
                  labelTitle: 'Nama Barang*',
                  labelHint: 'Masukan Nama Barang',
                  isNumeric: false,
                  controller: editC.namaController,
                  valueBarang: barang.nama_barang,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kelompok Barang*",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff202327),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      DropdownButtonFormField2(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nama Barang Belum diisi";
                          }
                          return null;
                        },
                        isExpanded: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 14),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.red.shade900,
                            ),
                          ),
                          errorStyle: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        hint: Text(
                          "Masukan Kelompok Barang",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: listKelompok
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: dropdownValue,
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                            editC.kelompokController = value;
                            print(editC.kelompokController);
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kategori Barang*",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff202327),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      DropdownButtonFormField2(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nama Barang Belum diisi";
                          }
                          return null;
                        },
                        isExpanded: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 14),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.red.shade900,
                            ),
                          ),
                          errorStyle: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        hint: Text(
                          "Masukan Kategori Barang",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: catC.categories
                            .map((item) => DropdownMenuItem<String>(
                                  value: item['id'].toString(),
                                  child: Text(
                                    item['nama_kategori'],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: dropdownValueKategori,
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValueKategori = value!;

                            editC.kategoriController = value;
                            print(value);
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ],
                  ),
                ),
                InputField(
                  labelTitle: 'Stok*',
                  labelHint: 'Masukan Stok',
                  isNumeric: true,
                  controller: editC.stokController,
                  valueBarang: barang.stok.toString(),
                ),
                InputField(
                  labelTitle: 'Harga*',
                  labelHint: 'Masukan Harga',
                  isNumeric: true,
                  controller: editC.hargaController,
                  valueBarang: barang.harga.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 16,
          child: MediaQuery.of(context).viewInsets.bottom != 0
              ? null
              : FloatingActionButton.small(
                  onPressed: () {
                    barangC.updateBarang(
                        idBarang,
                        editC.namaController.text,
                        editC.kategoriController.toString(),
                        editC.kelompokController.toString(),
                        editC.stokController.text,
                        editC.hargaController.text);

                    Get.back();
                  },
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  foregroundColor: Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: Color.fromARGB(255, 34, 96, 196),
                  child: Text('Edit Barang'),
                ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
