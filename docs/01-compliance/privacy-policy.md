# R6 — Kebijakan Privasi UniKantin

**Penanggung Jawab:** Muhammad Faiz Rabbany (2300016083)

*Terakhir diperbarui: 27 Oktober 2026*

---

Halo! Kebijakan ini menjelaskan bagaimana aplikasi **UniKantin** mengelola data kamu. Kami ingin kamu memahami data apa yang dikumpulkan, untuk apa, dan bagaimana kami melindunginya.

## 1. Data yang Dikumpulkan

Saat ini (Milestone 01 — Inisiasi Proyek), UniKantin **belum mengumpulkan data pengguna secara aktif**. Aplikasi masih dalam tahap pengembangan awal.

**Yang sudah ada pada M01:**
- PIN lokal untuk pengamanan akses aplikasi. PIN disimpan dalam bentuk **hash terenkripsi** di perangkat kamu, bukan sebagai teks biasa.

**Yang direncanakan pada milestone berikutnya:**
- Nama dan alamat email (untuk akun pengguna).
- Riwayat pesanan (menu yang dipesan, jumlah, harga, status).
- Peran pengguna (mahasiswa, penjual, atau admin).

**Yang TIDAK dikumpulkan:**
- Lokasi GPS.
- Kontak telepon.
- Foto atau akses kamera.
- Nomor kartu pembayaran atau data finansial sensitif.

## 2. Lokasi Penyimpanan

- **PIN lokal:** Disimpan di perangkat kamu menggunakan penyimpanan terenkripsi (Encrypted Shared Preferences pada Android).
- **Data akun dan pesanan (rencana):** Akan disimpan di Firebase (Google Cloud) dengan server di region yang ditentukan.

## 3. Tujuan Penggunaan Data

Data kamu digunakan **hanya** untuk:
- Mengidentifikasi akun kamu.
- Menampilkan menu dan memproses pesanan.
- Menampilkan riwayat pesanan kamu.
- Mengirim notifikasi status pesanan (jika diaktifkan).

Kami **tidak** menggunakan data kamu untuk iklan, penjualan ke pihak ketiga, atau tujuan di luar layanan UniKantin.

## 4. Hak Kamu

Sesuai UU Pelindungan Data Pribadi (UU No. 27 Tahun 2022), kamu berhak:
- **Mengetahui** data apa yang kami kumpulkan dan tujuannya.
- **Memperbaiki** data yang tidak akurat.
- **Mengakses** data pribadi kamu yang tersimpan.
- **Meminta penghapusan** data dan akun kamu.
- **Menarik persetujuan** atas pemrosesan data.
- **Mengajukan keluhan** jika merasa hak kamu dilanggar.

## 5. Perubahan Kebijakan

Kebijakan ini dapat diperbarui seiring perkembangan fitur UniKantin. Perubahan signifikan akan diberitahukan melalui aplikasi. Versi terbaru selalu tersedia di menu pengaturan aplikasi.

## 6. Kontak

Jika kamu memiliki pertanyaan atau ingin menggunakan hak-hak di atas, hubungi tim pengembang:

**Email:** [ALAMAT_EMAIL_KELOMPOK]

**Program Studi Sistem Informasi**
**Universitas Ahmad Dahlan**

---

> **Catatan M01:** Kebijakan ini disusun pada tahap inisiasi proyek. Isi akan diperbarui ketika fitur autentikasi, pemesanan, dan pembayaran diimplementasikan pada milestone berikutnya.
