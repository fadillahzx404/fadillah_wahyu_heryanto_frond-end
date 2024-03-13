class Barang {
  late int? id;
  late String? nama_barang;
  late int? kategori_id;
  late String? kelompok_barang;
  late int? stok;
  late int? harga;
  late String? nama_kategori;

  Barang({
    this.id,
    this.nama_barang,
    this.kategori_id,
    this.stok,
    this.kelompok_barang,
    this.harga,
    this.nama_kategori,
  });

  Barang.fromJson(json) {
    id = json['id'];
    nama_barang = json['nama_barang'];
    kategori_id = json['kategori_id'];
    kelompok_barang = json['kelompok_barang'];
    stok = json['stok'];
    harga = json['harga'];
    nama_kategori = json['nama_kategori'];
  }
}
