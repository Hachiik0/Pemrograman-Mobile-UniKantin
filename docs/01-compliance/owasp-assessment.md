# R4 — Penilaian OWASP Mobile Top 10 (2024) — UniKantin

**Penanggung Jawab:** Adam Bimantara (2300016021)

## Penilaian Risiko

| ID | Nama Risiko | Relevansi UniKantin | Status M01 | Kontrol / Mitigasi | Req ID | Bukti / Rencana Pengujian |
|---|---|---|---|---|---|---|
| M1 | Improper Credential Usage | **Tinggi.** UniKantin akan mengelola kredensial login mahasiswa, penjual, dan admin. | Belum diimplementasikan — Firebase Auth belum aktif. | Rencana: Firebase Auth untuk autentikasi; tidak menyimpan password di aplikasi; PIN lokal di-hash dengan PBKDF2. | SEC-01 | M01: PIN hashing diuji unit test. Firebase Auth diuji pada M02. |
| M2 | Inadequate Supply Chain Security | **Sedang.** Menggunakan package pihak ketiga (provider, flutter_secure_storage, cryptography, intl). | Dependency terpasang, belum diaudit mendalam. | `flutter pub outdated` dijalankan untuk memeriksa versi. Hanya menggunakan package dari pub.dev dengan skor tinggi. | SEC-04 | `dependency-review.txt` berisi output `flutter pub outdated`. |
| M3 | Insecure Authentication/Authorization | **Tinggi.** Tiga peran pengguna (mahasiswa, penjual, admin) memerlukan otorisasi berbeda. | Belum diimplementasikan. | Rencana: Firebase Auth + custom claims atau Firestore rules untuk otorisasi berbasis peran. | SEC-02 | Diuji pada milestone implementasi autentikasi. |
| M4 | Insufficient Input/Output Validation | **Sedang.** Input pesanan, menu, dan data profil perlu divalidasi. | Validasi PIN sudah ada (panjang dan format). Validasi input lain belum ada. | Rencana: Validasi di sisi client dan server; sanitasi input sebelum dikirim ke Firestore. | SEC-05 | M01: Unit test validasi PIN. |
| M5 | Insecure Communication | **Tinggi.** Data pesanan dan kredensial dikirim melalui jaringan. | `network_security_config.xml` sudah melarang cleartext HTTP. | Semua komunikasi wajib HTTPS. Network security config sudah diterapkan. Firebase SDK menggunakan HTTPS secara default. | SEC-06 | `sec-06-permissions.txt`, pemeriksaan network config. |
| M6 | Inadequate Privacy Controls | **Tinggi.** Data pribadi mahasiswa (nama, email, riwayat pesanan) harus dilindungi. | Kebijakan privasi (R6) sudah dibuat. Implementasi teknis belum ada. | Rencana: Mengikuti R1 (inventaris data), R3 (hak subjek), R6 (kebijakan privasi). Minimalisasi data. | PRV-01 | Dokumen R1, R3, R6 tersedia. |
| M7 | Insufficient Binary Protections | **Rendah** pada M01. Relevan saat aplikasi didistribusikan. | Belum ada obfuscation atau tamper detection. | Rencana: Mengaktifkan R8/ProGuard pada release build di milestone distribusi. | SEC-07 | Diuji pada milestone distribusi. |
| M8 | Security Misconfiguration | **Sedang.** Konfigurasi Android dan Firebase perlu diatur dengan benar. | `allowBackup="false"` dan network security config sudah diterapkan. | Pemeriksaan konfigurasi AndroidManifest. Lint `avoid_print` aktif. `.gitignore` mengabaikan file sensitif. | SEC-06 | `sec-03-lint.txt`, pemeriksaan manifest. |
| M9 | Insecure Data Storage | **Tinggi.** PIN dan data sensitif harus disimpan secara aman. | `flutter_secure_storage` dengan encrypted shared preferences sudah diterapkan untuk PIN. | PIN di-hash (PBKDF2) sebelum disimpan. Secure storage menggunakan enkripsi perangkat. Tidak ada data sensitif di SharedPreferences biasa. | SEC-03 | Unit test PinService, pemeriksaan Device File Explorer (manual). |
| M10 | Insufficient Cryptography | **Sedang.** Hashing PIN harus menggunakan algoritma yang kuat. | PBKDF2-HMAC-SHA256 dengan 120.000 iterasi dan salt acak sudah diimplementasikan. | Menggunakan package `cryptography` yang teruji. Salt acak kriptografis. Constant-time comparison. | SEC-03 | Unit test PinService memverifikasi hash dan verifikasi. |

## Ringkasan Status M01

| Kategori | Jumlah |
|---|---|
| Kontrol sudah diterapkan pada M01 | 5 (M2 parsial, M5, M8, M9, M10) |
| Direncanakan untuk milestone berikutnya | 5 (M1, M3, M4, M6, M7) |

**Catatan:** Penilaian ini bukan klaim bahwa aplikasi sudah aman sepenuhnya. Banyak kontrol yang masih berupa rencana dan perlu diimplementasikan serta diuji pada milestone berikutnya.
