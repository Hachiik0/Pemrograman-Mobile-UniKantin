# Project Charter — UniKantin

## Identitas Proyek

| Item | Detail |
|---|---|
| **Nama Proyek** | UniKantin |
| **Topik** | Aplikasi pemesanan makanan dan minuman kantin kampus berbasis mobile |
| **Mata Kuliah** | Pemrograman Mobile |
| **Program Studi** | Sistem Informasi |
| **Universitas** | Universitas Ahmad Dahlan |
| **Tahun Akademik** | 2026/2027 Gasal |
| **Kelompok** | [NOMOR KELOMPOK] |

### Anggota Kelompok

| No | Nama | NIM |
|---|---|---|
| 1 | Lalu Atwi Suparman | 2300016074 |
| 2 | Adam Bimantara | 2300016021 |
| 3 | Muhammad Faiz Rabbany | 2300016083 |
| 4 | M. Riski Almunawar | 2300016123 |

## Visi

Mempermudah mahasiswa memesan makanan dan minuman di kantin kampus secara digital serta membantu penjual kantin mengelola pesanan dengan lebih efisien dan transparan.

## Tujuan Terukur

1. **Katalog menu dapat ditampilkan dalam waktu kurang dari 3 detik** pada perangkat Android dengan koneksi lokal (target pengujian pada milestone implementasi).
2. **Alur pembuatan pesanan dapat diselesaikan dalam maksimal 4 langkah** (pilih tenant → pilih menu → konfirmasi → kirim pesanan).
3. **Status pesanan diperbarui dan ditampilkan secara konsisten** dalam waktu kurang dari 5 detik setelah penjual mengubah status.

> **Catatan:** Semua target di atas masih berupa rancangan dan belum diuji pada M01.

## Pengguna Sasaran

- **Mahasiswa:** Melihat daftar menu, membuat pesanan, memantau status pesanan.
- **Penjual Kantin:** Mengelola menu, menerima pesanan, memperbarui status pesanan.
- **Admin:** Mengelola akun pengguna, mengelola tenant kantin, memantau data transaksi.

## Scope MoSCoW

### Must Have (Wajib — target produk akhir)
- Login dan registrasi pengguna.
- Katalog menu makanan dan minuman per tenant.
- Pembuatan pesanan oleh mahasiswa.
- Pembaruan status pesanan oleh penjual.
- Tampilan riwayat pesanan.

### Should Have (Sebaiknya ada)
- Notifikasi status pesanan (FCM).
- Pencarian menu.
- Profil pengguna.

### Could Have (Boleh ada jika waktu cukup)
- Pembayaran e-wallet.
- Rating dan ulasan menu.
- Dashboard penjualan untuk penjual.

### Won't Have (Tidak dikerjakan semester ini)
- Sistem delivery / antar makanan.
- Integrasi multi-kampus.
- Fitur loyalty point.

> **Pekerjaan M01:** Pada milestone ini, yang diimplementasikan adalah fondasi proyek (struktur, konfigurasi, dokumentasi kepatuhan, baseline keamanan). Fitur fungsional belum diimplementasikan.

## Batasan

1. Menggunakan Flutter/Dart sebagai framework utama.
2. Target awal platform Android.
3. Tim terdiri dari empat anggota mahasiswa.
4. Waktu pengerjaan satu semester.
5. Infrastruktur backend (Firebase) belum disiapkan sepenuhnya pada M01.
6. Kebutuhan pengguna belum divalidasi melalui wawancara langsung.

## Risiko Awal

| Risiko | Dampak | Mitigasi |
|---|---|---|
| Keterlambatan pengerjaan karena beban tugas mata kuliah lain | Fitur tidak selesai tepat waktu | Pembagian tugas jelas, prioritas MoSCoW |
| Kompleksitas integrasi payment gateway | Fitur pembayaran tidak stabil | Ditangguhkan ke Could Have, fokus pada alur pesanan |
| Keamanan data pengguna (kredensial, transaksi) | Kebocoran data pribadi mahasiswa | Penerapan baseline keamanan sejak M01, enkripsi penyimpanan |

## Kriteria Sukses

1. Proyek berhasil di-build tanpa error (`flutter analyze` lulus, `flutter build apk` berhasil).
2. Seluruh dokumen kepatuhan (R1–R6) dan katalog requirement tersedia dan konsisten.
3. Fondasi kode (repository pattern, model, service) tersedia dan lulus unit test.
4. Baseline keamanan (PIN hashing, secure storage, network config) terpasang.
5. Repository Git terstruktur rapi dengan tag `m01-initiation`.
