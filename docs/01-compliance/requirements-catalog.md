# Katalog Requirement UniKantin

**Penanggung Jawab Integrasi:** M. Riski Almunawar (2300016123)

## PRV — Privasi

| ID | Deskripsi | Sumber | Milestone | Status | Bukti / Rencana Verifikasi |
|---|---|---|---|---|---|
| PRV-01 | Kebijakan privasi tersedia dan menjelaskan data yang dikumpulkan, tujuan, serta hak pengguna. | R1, R3, R5, R6 | M01 (dokumen), M02 (UI) | ✅ Dokumen selesai | `docs/01-compliance/privacy-policy.md` |
| PRV-02 | Data tenant hanya dapat diakses oleh penjual yang terdaftar pada tenant tersebut. | R1 | M03 | ⏳ Direncanakan | Firestore Security Rules + pengujian akses |
| PRV-03 | Riwayat pesanan hanya dapat diakses oleh pemilik pesanan dan penjual terkait. | R1, R2 | M03 | ⏳ Direncanakan | Firestore Security Rules + pengujian akses |
| PRV-04 | Nominal transaksi tidak dipublikasikan atau dapat diakses pengguna lain. | R1 | M03 | ⏳ Direncanakan | Pengujian akses data transaksi |
| PRV-05 | Pengguna dapat mengubah data profil (nama tampilan). | R3 | M03 | ⏳ Direncanakan | Pengujian fitur edit profil |
| PRV-06 | Pengguna dapat mengakses dan melihat seluruh data pribadinya. | R3 | M03 | ⏳ Direncanakan | Pengujian halaman profil + riwayat |
| PRV-07 | Pengguna dapat menghapus akun dan data pribadinya. | R3 | M03 | ⏳ Direncanakan | Pengujian fitur hapus akun |
| PRV-08 | Pengguna dapat menarik persetujuan (menonaktifkan notifikasi, hapus akun). | R3 | M03 | ⏳ Direncanakan | Pengujian pengaturan notifikasi |
| PRV-09 | Informasi kontak pengelola tersedia untuk keluhan terkait data pribadi. | R3, R6 | M01 (dokumen) | ✅ Placeholder tersedia | Kontak di kebijakan privasi |

## SEC — Keamanan

| ID | Deskripsi | Sumber | Milestone | Status | Bukti / Rencana Verifikasi |
|---|---|---|---|---|---|
| SEC-01 | Password tidak disimpan dalam plaintext; menggunakan hash yang aman. | R1, R4 (M1) | M01 (PIN), M02 (Firebase Auth) | ✅ PIN: PBKDF2 | Unit test `pin_service_test.dart` |
| SEC-02 | Otorisasi berbasis peran (mahasiswa, penjual, admin) membatasi akses fitur dan data. | R2, R4 (M3) | M03 | ⏳ Direncanakan | Pengujian role-based access |
| SEC-03 | Data sensitif disimpan menggunakan penyimpanan terenkripsi (flutter_secure_storage). | R4 (M9, M10) | M01 | ✅ Diterapkan | Unit test, `evidence/` |
| SEC-04 | Dependency diperiksa secara berkala untuk kerentanan. | R4 (M2) | M01 | ✅ Diperiksa | `dependency-review.txt` |
| SEC-05 | Input pengguna divalidasi sebelum diproses (client-side dan server-side). | R4 (M4) | M01 (PIN), M03 (lainnya) | ⚠️ Parsial | Unit test validasi PIN |
| SEC-06 | Komunikasi jaringan hanya menggunakan HTTPS; cleartext HTTP dilarang. | R4 (M5, M8) | M01 | ✅ Diterapkan | `network_security_config.xml`, manifest |
| SEC-07 | Binary protection (obfuscation) diaktifkan pada distribusi. | R4 (M7) | M04+ | ⏳ Direncanakan | Build flag `--obfuscate` |

## UX — Pengalaman Pengguna

| ID | Deskripsi | Sumber | Milestone | Status | Bukti / Rencana Verifikasi |
|---|---|---|---|---|---|
| UX-01 | Harga dan ketersediaan menu ditampilkan secara akurat dan konsisten. | R2, R5 | M02 | ⏳ Direncanakan | Pengujian UI katalog menu |
| UX-02 | Status pembayaran ditampilkan apa adanya tanpa manipulasi. | R2, R5 | M03 | ⏳ Direncanakan | Pengujian alur pembayaran |
| UX-03 | Tidak ada opsi berbayar yang terpilih secara default (pre-selected). | R5 | M02 | ⏳ Direncanakan | Pengujian form pesanan |
| UX-04 | Label tombol menggunakan bahasa yang jelas, tanpa negasi ganda. | R5 | M02 | ⏳ Direncanakan | Review UI |
| UX-05 | Proses pembatalan pesanan mudah ditemukan dan dilakukan. | R5 | M02 | ⏳ Direncanakan | Pengujian alur pembatalan |
| UX-06 | Tidak ada confirmshaming pada pilihan penolakan. | R5 | M02 | ⏳ Direncanakan | Review teks UI |
| UX-07 | Total harga ditampilkan jelas di setiap tahap sebelum konfirmasi. | R5 | M02 | ⏳ Direncanakan | Pengujian UI checkout |
| UX-08 | Hierarki visual seimbang; informasi penting tidak disembunyikan. | R5 | M02 | ⏳ Direncanakan | Review desain UI |

## Ringkasan Status M01

| Kategori | Total | Selesai | Parsial | Direncanakan |
|---|---|---|---|---|
| PRV | 9 | 2 | 0 | 7 |
| SEC | 7 | 4 | 1 | 2 |
| UX | 8 | 0 | 0 | 8 |
| **Total** | **24** | **6** | **1** | **17** |
