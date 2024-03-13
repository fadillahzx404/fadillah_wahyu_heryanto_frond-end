import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fadillah_wahyu_heryanto_frontend/controllers/add_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/controllers/edit_barang.dart';
import 'package:fadillah_wahyu_heryanto_frontend/controllers/list_barang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DropDownWidget extends StatefulWidget {
  final String? labelTitle;
  final String? labelHint;

  final String? Function(String?)? validator;

  const DropDownWidget(
      {super.key, this.labelTitle, this.labelHint, this.validator});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  final catC = Get.find<ListBarangC>();
  final addC = Get.find<AddBarangC>();
  final editC = Get.find<EditBarangC>();

  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.labelTitle}",
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
            validator: widget.validator,
            isExpanded: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 14),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.red.shade900,
                ),
              ),
              errorStyle: TextStyle(fontWeight: FontWeight.w500),
            ),
            hint: Text(
              "${widget.labelHint}",
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
                            fontSize: 14, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: dropdownValue,
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
                addC.kategoriController = value;
                editC.kategoriController = value;
              });
            },
            buttonStyleData: ButtonStyleData(
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }
}
