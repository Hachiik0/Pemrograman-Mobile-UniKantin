# UniKantin

Aplikasi pemesanan makanan dan minuman kantin kampus berbasis mobile.

## Deskripsi

UniKantin adalah aplikasi mobile yang membantu mahasiswa memesan makanan dan minuman di kantin kampus secara digital, serta membantu penjual kantin mengelola pesanan dengan lebih efisien. Aplikasi ini dikembangkan sebagai bagian dari mata kuliah Pemrograman Mobile, Program Studi Sistem Informasi, Universitas Ahmad Dahlan.

## Anggota Kelompok [NOMOR KELOMPOK]

| No | Nama | NIM |
|---|---|---|
| 1 | Lalu Atwi Suparman | 2300016074 |
| 2 | Adam Bimantara | 2300016021 |
| 3 | Muhammad Faiz Rabbany | 2300016083 |
| 4 | M. Riski Almunawar | 2300016123 |

## Teknologi

- **Framework:** Flutter 3.47.8
- **Bahasa:** Dart 3.13.7
- **Target Platform:** Android (utama), Web (pengujian)
- **Backend (rencana):** Firebase (Firestore, Auth, FCM)
- **State Management:** Provider
- **Penyimpanan Aman:** flutter_secure_storage
- **Kriptografi:** cryptography (PBKDF2-HMAC-SHA256)

## Persyaratan Lingkungan

- Flutter SDK ≥ 3.47.0
- Dart SDK ≥ 3.13.0
- Android SDK ≥ 36 (untuk build Android)
- Git
- VS Code atau Android Studio

## Cara Instalasi

```bash
# Clone repository
git clone [URL_REPOSITORY]
cd unikantin

# Instal dependencies
flutter pub get
```

## Cara Menjalankan

```bash
# Menjalankan di Chrome (web)
flutter run -d chrome

# Menjalankan di emulator/perangkat Android
flutter run -d [DEVICE_ID]

# Build APK release
flutter build apk --release
```

## Struktur Folder

```
unikantin/
├── android/                  # Konfigurasi Android
├── docs/                     # Dokumentasi proyek
│   ├── 00-charter.md         # Project Charter
│   ├── 01-compliance/        # Register kepatuhan (R1–R6)
│   │   ├── data-inventory.md         # R1: Inventaris data pribadi
│   │   ├── ethics-matrix.md          # R2: Matriks etika
│   │   ├── pdp-rights-map.md         # R3: Peta hak subjek data
│   │   ├── owasp-assessment.md       # R4: Penilaian OWASP
│   │   ├── dark-pattern-audit.md     # R5: Audit dark pattern
│   │   ├── privacy-policy.md         # R6: Kebijakan privasi
│   │   ├── requirements-catalog.md   # Katalog requirement
│   │   └── evidence/                 # Bukti pengujian
│   ├── 02-requirements/      # Kebutuhan (milestone berikutnya)
│   ├── 03-design/            # Desain (milestone berikutnya)
│   └── adr/                  # Architecture Decision Records
│       └── 001-repository-pattern.md
├── design/                   # Aset desain
├── lib/                      # Kode sumber
│   ├── core/                 # Konfigurasi dan tema
│   │   ├── app_config.dart
│   │   └── app_theme.dart
│   ├── models/               # Model data
│   │   └── order.dart
│   ├── repositories/         # Repository pattern
│   │   ├── order_repository.dart
│   │   └── in_memory_order_repository.dart
│   ├── services/             # Layanan
│   │   ├── secure_storage_service.dart
│   │   └── pin_service.dart
│   ├── providers/            # State management (rencana)
│   ├── screens/              # Halaman UI (rencana)
│   ├── widgets/              # Widget reusable (rencana)
│   └── main.dart             # Entry point
├── test/                     # Unit test
│   ├── order_repository_test.dart
│   └── pin_service_test.dart
├── .gitignore
├── analysis_options.yaml
├── pubspec.yaml
└── pubspec.lock
```

## Status Milestone

| Milestone | Status | Keterangan |
|---|---|---|
| M01 — Inisiasi Proyek | ✅ Selesai | Struktur, dokumentasi, fondasi kode, baseline keamanan |
| M02 — Implementasi UI | ⏳ Belum dimulai | — |
| M03 — Backend & Auth | ⏳ Belum dimulai | — |
| M04 — Distribusi | ⏳ Belum dimulai | — |

## Catatan Keamanan

- **PIN lokal** di-hash menggunakan PBKDF2-HMAC-SHA256 (120.000 iterasi, salt acak 256-bit).
- **Data sensitif** disimpan menggunakan `flutter_secure_storage` (Encrypted Shared Preferences pada Android).
- **Cleartext HTTP** dilarang melalui `network_security_config.xml`.
- **Backup otomatis** dinonaktifkan (`android:allowBackup="false"`).
- **Lint `avoid_print`** aktif untuk mencegah log sensitif di production.
- Tidak ada API key, password, atau secret yang di-hardcode dalam repository.

## Cara Menjalankan Pemeriksaan

```bash
# Format kode
dart format .

# Analisis statis
flutter analyze

# Unit test
flutter test

# Periksa dependency
flutter pub outdated

# Build release
flutter build apk --release
```

## Informasi Tambahan

M01 merupakan tahap **inisiasi proyek**. Fitur fungsional (login, katalog menu, pemesanan, pembayaran, notifikasi) belum diimplementasikan dan akan dikembangkan pada milestone berikutnya.
