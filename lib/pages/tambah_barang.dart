import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fadillah_wahyu_heryanto_frontend/components/dropdown_widget.dart';
import 'package:fadillah_wahyu_heryanto_frontend/components/inputfield.dart';
import 'package:fadillah_wahyu_heryanto_frontend/controllers/add_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/controllers/list_barang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<String> listKelompok = <String>['one', 'two', 'three', 'four'];

class TambahBarang extends StatefulWidget {
  TambahBarang({super.key});

  @override
  State<TambahBarang> createState() => _TambahBarangState();
}

class _TambahBarangState extends State<TambahBarang> {
  final addC = Get.find<AddBarangC>();

  final barangC = Get.find<ListBarangC>();

  final formValid = RxBool(false);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? dropdownValue;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Barang',
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
                  controller: addC.namaController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama Barang Belum diisi";
                    }
                    return null;
                  },
                  isNumeric: false,
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
                            return "Kelompok Barang Belum diisi";
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

                            addC.kelompokController = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ],
                  ),
                ),
                DropDownWidget(
                  labelTitle: 'Kategori',
                  labelHint: 'Masukan Kategori Barang',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kelompok Barang Belum diisi";
                    }
                    return null;
                  },
                ),
                InputField(
                  labelTitle: 'Stok*',
                  labelHint: 'Masukan Stok',
                  controller: addC.stokController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Stok Belum diisi";
                    }
                    return null;
                  },
                  isNumeric: true,
                ),
                InputField(
                  labelTitle: 'Harga*',
                  labelHint: 'Masukan Harga',
                  controller: addC.hargaController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Harga Belum diisi";
                    }
                    return null;
                  },
                  isNumeric: true,
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
                  onPressed: () async {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      barangC.add(
                        addC.namaController.text,
                        addC.kategoriController,
                        addC.kelompokController,
                        addC.stokController.text,
                        addC.hargaController.text,
                      );
                    }
                  },
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  foregroundColor: Color(0xffA9B9CC),
                  backgroundColor: Color(0xffF1F4F9),
                  child: Text('Tambah Barang'),
                ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
