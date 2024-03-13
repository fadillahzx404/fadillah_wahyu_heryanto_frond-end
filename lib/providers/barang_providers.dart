import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BarangProvider extends GetConnect {
  final String serverUrl = 'http://localhost:8000';

  Future<Response> addBarang(String? namaBarang, int? kategoriBarang,
      String? kelompokBarang, String? stokBarang, String? hargaBarang) async {
    final body = json.encode({
      'nama_barang': namaBarang,
      'kategori_id': kategoriBarang,
      'kelompok_barang': kelompokBarang,
      'stok': int.parse('$stokBarang'),
      'harga': int.parse('$hargaBarang'),
    });

    return post('$serverUrl/api/tambah_barang', body);
  }

  Future<Response> updateBarang(
      int? id,
      String? namaBarang,
      int? kategoriBarang,
      String? kelompokBarang,
      int? stokBarang,
      int? hargaBarang) async {
    final body = json.encode({
      'nama_barang': namaBarang,
      'kategori_id': kategoriBarang,
      'kelompok_barang': kelompokBarang,
      'stok': stokBarang,
      'harga': hargaBarang,
    });

    return put("$serverUrl/api/edit_barang/$id", body);
  }

  Future<void> deleteBarang(int? id) async {
    final res = await http.delete(
      Uri.parse('$serverUrl/api/hapus_barang/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    // print(res.body);
    // print(res.statusCode);

    if (res.statusCode == 201) {
      print(res.body);
    } else {
      throw Exception('Barang Gagal DiHapus !!');
    }
  }

  Future<void> deleteAllBarang() async {
    final res = await http.delete(
      Uri.parse('$serverUrl/api/all_barang'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    // print(res.body);
    // print(res.statusCode);

    if (res.statusCode == 201) {
      print(res.body);
    } else {
      throw Exception('Barang Gagal DiHapus !!');
    }
  }

  Future<void> deleteSelectedBarang(dynamic array) async {
    final res = await http.delete(
      Uri.parse('$serverUrl/api/hapus_barang/selected/$array'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    // print(res.body);
    // print(res.statusCode);

    if (res.statusCode == 201) {
      print(res.body);
    } else {
      throw Exception('Barang Gagal DiHapus !!');
    }
  }
}
