import 'dart:io';

void main() {
  // Daftar harga produk
  Map<String, int> hargaProduk = {
    'ayam': 10000,
    'nasi': 3000,
    'esteh': 3000,
  };

  // Fungsi untuk menghitung total harga
  int hitungTotal(Map<String, int> keranjang, Map<String, int> harga) {
    int total = 0;
    keranjang.forEach((produk, jumlah) {
      total += harga[produk]! * jumlah; // Penggunaan operator + dan *
    });
    return total;
  }

  // Fungsi untuk memberikan diskon
  int berikanDiskon(int total, int persenDiskon) {
    return total - ((total * persenDiskon) ~/ 100); // Penggunaan operator -, *, dan ~/
  }

  // Fungsi untuk menampilkan struk
  void tampilkanStruk(Map<String, int> keranjang, Map<String, int> harga, int persenDiskon) {
    int totalSebelumDiskon = hitungTotal(keranjang, harga);
    int totalSetelahDiskon = berikanDiskon(totalSebelumDiskon, persenDiskon);

    print('\nStruk Belanja');
    print('-------------');
    keranjang.forEach((produk, jumlah) {
      print('$produk x $jumlah = ${harga[produk]! * jumlah}');
    });
    print('Total sebelum diskon: $totalSebelumDiskon');
    print('Diskon: $persenDiskon%');
    print('Total setelah diskon: $totalSetelahDiskon');
  }

  // Menggunakan closure untuk memproses pembayaran
  void prosesPembayaran(Map<String, int> keranjang, Map<String, int> harga, int persenDiskon) {
    tampilkanStruk(keranjang, harga, persenDiskon);
  }

  // Input dari pengguna
  Map<String, int> keranjangBelanja = {};

  while (true) {
    print('\nMasukkan nama produk (atau ketik "selesai" untuk mengakhiri):');
    String? produk = stdin.readLineSync();

    if (produk == 'selesai') {
      break;
    }

    if (!hargaProduk.containsKey(produk)) {
      print('Produk tidak tersedia. Silakan masukkan produk yang valid.');
      continue;
    }

    print('Masukkan jumlah untuk $produk:');
    String? jumlahInput = stdin.readLineSync();
    int? jumlah = int.tryParse(jumlahInput!);

    if (jumlah == null || jumlah <= 0) {
      print('Jumlah tidak valid. Silakan masukkan jumlah yang valid.');
      continue;
    }

    if (keranjangBelanja.containsKey(produk)) {
      keranjangBelanja[produk!] = keranjangBelanja[produk]! + jumlah; // Penggunaan operator +=
    } else {
      keranjangBelanja[produk!] = jumlah;
    }
  }

  print('Masukkan persentase diskon:');
  String? diskonInput = stdin.readLineSync();
  int? persenDiskon = int.tryParse(diskonInput!);

  if (persenDiskon == null || persenDiskon < 0) {
    persenDiskon = 0;
  }

  // Memproses pembayaran
  prosesPembayaran(keranjangBelanja, hargaProduk, persenDiskon);
}
