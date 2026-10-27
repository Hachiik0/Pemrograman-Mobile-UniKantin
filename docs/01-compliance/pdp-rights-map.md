# R3 — Peta Hak Subjek Data UniKantin

**Penanggung Jawab:** Lalu Atwi Suparman (2300016074)

## Pemetaan Hak Berdasarkan UU Pelindungan Data Pribadi (UU PDP No. 27 Tahun 2022)

| No | Hak | Dasar Hukum | Implementasi yang Direncanakan pada UniKantin | Req ID | Milestone |
|---|---|---|---|---|---|
| 1 | **Hak informasi** — Mengetahui data apa yang dikumpulkan dan tujuannya | Pasal 5–8 UU PDP | Menyediakan kebijakan privasi (R6) yang menjelaskan jenis data, tujuan, dan lokasi penyimpanan. Kebijakan ditampilkan saat onboarding dan dapat diakses kapan saja dari menu pengaturan. | PRV-01 | M02 (UI), M01 (dokumen) |
| 2 | **Hak koreksi** — Meminta perbaikan data yang tidak akurat | Pasal 6 UU PDP | Pengguna dapat mengubah nama tampilan dan data profil melalui halaman profil. Perubahan email memerlukan verifikasi ulang melalui Firebase Auth. | PRV-05 | M03 (implementasi) |
| 3 | **Hak akses dan salinan** — Mengakses data pribadi yang disimpan | Pasal 7 UU PDP | Pengguna dapat melihat seluruh data profilnya dan riwayat pesanannya. Fitur ekspor data (jika dikembangkan) akan memungkinkan pengunduhan dalam format yang dapat dibaca. | PRV-06 | M03 (implementasi) |
| 4 | **Hak penghapusan** — Meminta penghapusan data pribadi | Pasal 8 UU PDP | Menyediakan opsi hapus akun dari halaman pengaturan. Penghapusan akun menghapus data profil dari Firebase Auth. Data pesanan yang sudah selesai dapat dianonimkan sesuai kebijakan retensi. | PRV-07 | M03 (implementasi) |
| 5 | **Hak menarik persetujuan** — Menarik kembali persetujuan pemrosesan data | Pasal 9 UU PDP | Pengguna dapat menonaktifkan notifikasi push. Penarikan persetujuan penuh dilakukan melalui penghapusan akun. Aplikasi tidak memproses data tanpa persetujuan aktif. | PRV-08 | M03 (implementasi) |
| 6 | **Hak ganti rugi atau keluhan** — Mengajukan keluhan atau klaim | Pasal 12 UU PDP | Menyediakan informasi kontak pengelola di kebijakan privasi. Pengguna dapat menghubungi tim pengembang melalui email yang tertera. Proses penanganan keluhan didokumentasikan. | PRV-09 | M02 (UI kontak) |

## Status Implementasi pada M01

Pada M01, **belum ada hak yang diimplementasikan secara fungsional** dalam aplikasi.

Yang sudah tersedia pada M01:
- Dokumen kebijakan privasi (R6) sebagai pemenuhan awal Hak Informasi.
- Rencana implementasi untuk setiap hak pada milestone berikutnya.

Hak-hak di atas akan diimplementasikan secara bertahap seiring dengan pengembangan fitur autentikasi, profil, dan pengaturan pengguna.
