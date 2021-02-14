
<hr>

## Daftar Isi
1. [Fitur](#fitur)
3. [Instalasi](#instalasi)
    - [Login Admin](###login-admin)
4. [Input Produk dan Satuan](#input-produk-dan-satuan)
5. [Proses Transaksi](#proses-transksi)
    - [Keranjang Belanja](#keranjang-belanja)
    - [Proses Entry Transaksi](#proses-entry-transaksi)

<hr>

## Fitur

Fitur Aplikasi:

1. Akun Login
    - Login dan Logout User
    - Ganti Password User
2. Entry Transaksi
    - Entry Transaksi Tunai
    - Entry Transaksi Kredit
    - Pencarian Produk
    - Konfirmasi Transaksi
    - Cetak Nota (PDF; Format A4)
3. Manajemen Produk
    - List Produk
    - Cetak Daftar Harga
    - Input Produk Baru
    - Edit Produk (Harga Tunai dan Kredit)
    - Hapus Produk
4. Manajemen Satuan Produk
    - List Satuan Produk
    - Input Produk Baru
    - Edit Satuan Produk
    - Hapus Satuan Produk
5. Manajemen Transaksi
    - List Transaksi Hari ini
    - List Transaksi
    - Detail Transaksi
    - Cetak Nota (PDF; Format A4)
6. Laporan Penjualan
    - Penjualan Per Tahun
    - Penjualan Per Bulan
    - Penjualan Per Tanggal
6. Manajemen User
    - List User
    - Input User Baru
    - Edit User
    - Hapus User (jika tidak ada transaksi)

Catatan:
- **Transaksi Kredit** hanya ditujukan untuk membedakan harga produk, bukan input pembayaran yang diangsur oleh customer.

<hr>

## Instalasi

    ```
    APP_NAME="Apotek Jaya"
    STORE_NAME="Apotek Jaya"
    STORE_ADDRESS="Jln. Pangeran, No. XX Pontianak, "
    STORE_PHONE="08xxxxxxxx"
    ```
8. `php artisan migrate --seed`
9. `php artisan serve` jika error gunakan `php -S localhost:8000 -t public`
10. Selesai

### Login Admin
```
Username: admin
Password: password
```

<hr>

## Input Produk dan Satuan
Untuk mulai menggunakan aplikasi, inputkan **Satuan Produk** terlebih dahulu, misal:
`Box, Botol, Kaleng, Keping, Pak, Pcs`

Kemudian inputkan **Produk** agar dapat dimasukkan ke dalam transaksi belanja (Cart)

<hr>

## Proses Transksi

### Keranjang Belanja

**Keranjang Belanja** didesain agar mengikuti hirarki berikut:
- Kelas **CartCollection** memiliki beberapa kelas **CashDraft** dan atau **CreditDraft**
- Kelas **CashDraft** memiliki beberapa **Item** dengan harga **Tunai**
- Kelas **CreditDraft** memiliki beberapa **Item** dengan harga **Kredit**
- Kelas **CashDraft** akan disimpan sebagai transaksi dengan model **Transaction** tipe **Tunai**
- Kelas **CreditDraft** akan disimpan sebagai transaksi dengan model **Transaction** tipe **Kredit**

### Proses Entry Transaksi

Proses Entry transaksi baru:

1. User login
2. Klik tombol **Transaksi Tunai** (atau **Transaksi Kredit**)
3. Cari produk (minimal 3 huruf)
4. Muncul list produk dengan harga sesuai jenis transaksi
5. Isi **Jumlah Item**, klik **Tambah**
6. Item produk yang bersangkutan akan muncul pada List Item
7. Isi data pembeli
8. Klik **Proses Transaksi**
9. Muncul halaman **Konfirmasi Transaksi** (cek list item, harga dan total)
10. Klik **Simpan Transaksi**
11. Muncul halaman **Detail Transaksi**
12. **Cetak Nota** format PDF ukuran A4.

