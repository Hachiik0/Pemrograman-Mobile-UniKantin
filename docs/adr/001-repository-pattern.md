# ADR-001: Penggunaan Repository Pattern

## Status

Diterima

## Tanggal

2026-10-27

## Konteks

UniKantin memerlukan arsitektur yang memisahkan logika bisnis dan akses data dari lapisan presentasi (UI). Pada M01, aplikasi belum terhubung ke backend Firestore. Namun, arsitektur harus disiapkan agar perpindahan dari penyimpanan lokal ke Firestore dapat dilakukan tanpa mengubah logika bisnis.

Slide dosen mencontohkan `ExpenseRepository` pada aplikasi CatatYuk!. UniKantin mengadaptasi pola yang sama untuk domain pemesanan makanan dengan `OrderRepository`.

## Keputusan

Menggunakan **Repository Pattern** dengan:

1. **Interface abstrak** (`OrderRepository`) yang mendefinisikan kontrak operasi CRUD.
2. **Implementasi in-memory** (`InMemoryOrderRepository`) untuk M01 dan pengujian unit.
3. **Implementasi Firestore** (rencana milestone berikutnya) yang akan mengimplementasikan interface yang sama.

## Alasan

- **Separation of Concerns:** UI dan logika bisnis tidak perlu mengetahui sumber data.
- **Testability:** Unit test dapat menggunakan implementasi in-memory tanpa perlu emulator atau koneksi jaringan.
- **Fleksibilitas:** Perpindahan ke Firestore hanya memerlukan implementasi baru dari interface yang sama.
- **Konsistensi dengan panduan dosen:** Mengikuti pola yang diajarkan pada slide M01.

## Alternatif yang Dipertimbangkan

1. **Langsung menggunakan Firestore:** Ditolak karena backend belum disiapkan pada M01 dan mempersulit pengujian.
2. **Tanpa abstraksi (akses data langsung dari UI):** Ditolak karena melanggar prinsip separation of concerns dan mempersulit perpindahan data source di kemudian hari.
3. **Menggunakan SQLite lokal:** Dipertimbangkan, namun tidak dipilih karena rencana akhir adalah Firestore, bukan database relasional lokal.

## Konsekuensi

### Positif
- Kode lebih modular dan mudah diuji.
- Perpindahan ke Firestore lebih mulus.
- Sesuai dengan pola yang diajarkan dosen.

### Negatif
- Menambah satu lapisan abstraksi (interface + implementasi).
- Data in-memory hilang saat aplikasi ditutup (sesuai tujuan M01).

## Adaptasi dari CatatYuk!

| CatatYuk! | UniKantin | Alasan |
|---|---|---|
| `ExpenseRepository` | `OrderRepository` | Domain berbeda: pencatatan pengeluaran vs pemesanan makanan |
| Model `Expense` | Model `Order` + `OrderItem` | Pesanan memiliki banyak item, bukan satu entri pengeluaran |
| Atribut: amount, category | Atribut: items, totalPrice, tenantId, status | Sesuai kebutuhan data pemesanan kantin |
