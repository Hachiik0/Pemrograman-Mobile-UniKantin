# R1 — Inventaris Data Pribadi UniKantin

**Penanggung Jawab:** Lalu Atwi Suparman (2300016074)

## Data yang Dikumpulkan (Direncanakan)

| No | Data | Kategori UU PDP | Tujuan | Lokasi Penyimpanan | Retensi | Perlindungan | Req ID |
|---|---|---|---|---|---|---|---|
| 1 | Nama pengguna | Data pribadi umum | Identifikasi akun, tampilan profil | Firebase Auth (rencana) | Selama akun aktif | Enkripsi transit (HTTPS), akses terbatas | PRV-01 |
| 2 | Alamat email | Data pribadi umum | Autentikasi, pemulihan akun | Firebase Auth (rencana) | Selama akun aktif | Enkripsi transit, tidak ditampilkan ke pengguna lain | PRV-01 |
| 3 | Password (hash) | Data pribadi umum | Autentikasi | Firebase Auth (rencana) | Selama akun aktif | Di-hash oleh Firebase Auth, tidak disimpan plaintext | SEC-01 |
| 4 | Peran pengguna (role) | Bukan data pribadi | Otorisasi fitur (mahasiswa/penjual/admin) | Firestore (rencana) | Selama akun aktif | Firestore Security Rules (rencana) | SEC-02 |
| 5 | ID tenant | Bukan data pribadi | Mengaitkan penjual dengan kantin | Firestore (rencana) | Selama tenant aktif | Akses terbatas berdasarkan role | PRV-02 |
| 6 | Riwayat pesanan | Data pribadi umum | Menampilkan riwayat kepada mahasiswa | Firestore (rencana) | Sesuai kebijakan retensi | Akses hanya oleh pemilik pesanan dan penjual terkait | PRV-03 |
| 7 | Item pesanan (nama menu, jumlah, harga) | Bukan data pribadi | Detail pesanan | Firestore (rencana) | Mengikuti retensi pesanan | Terkait dengan pesanan induk | PRV-03 |
| 8 | Nominal transaksi | Data pribadi umum | Pencatatan pembayaran | Firestore (rencana) | Sesuai kebijakan retensi | Akses terbatas, tidak dipublikasikan | PRV-04 |
| 9 | Status pembayaran | Bukan data pribadi | Menampilkan progres pembayaran | Firestore (rencana) | Mengikuti retensi pesanan | Konsisten dengan status pesanan | UX-01 |
| 10 | PIN lokal (hash + salt) | Data pribadi umum | Pengamanan akses aplikasi di perangkat | Secure Storage perangkat | Selama PIN aktif | PBKDF2-HMAC-SHA256, tidak plaintext | SEC-03 |

## Data yang TIDAK Dikumpulkan

| Data | Alasan Tidak Dikumpulkan |
|---|---|
| Lokasi GPS | Tidak diperlukan — kantin kampus sudah diketahui lokasinya |
| Kontak telepon | Tidak diperlukan untuk alur pemesanan |
| Foto / kamera | Tidak ada fitur yang memerlukan kamera pada rancangan saat ini |
| Data pembayaran sensitif (nomor kartu, CVV) | Akan menggunakan payment gateway pihak ketiga jika diimplementasikan |
| Nomor KTM / identitas akademik | Tidak diperlukan, cukup email untuk autentikasi |

## Status Implementasi pada M01

Pada M01, **belum ada data pengguna yang benar-benar dikumpulkan** karena:
- Firebase Auth belum diaktifkan.
- Firestore belum terhubung.
- Aplikasi menggunakan data in-memory untuk pengujian.

Data yang tercantum di atas adalah **rencana** untuk milestone implementasi berikutnya.

Satu-satunya data yang disimpan di perangkat pada M01 adalah **hash PIN lokal** dan **salt** melalui `flutter_secure_storage` (terenkripsi).
