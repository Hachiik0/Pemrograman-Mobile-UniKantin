# R2 — Matriks Etika UniKantin

**Penanggung Jawab:** Adam Bimantara (2300016021)

## Sumber Kode Etik

1. **ACM Code of Ethics and Professional Conduct (2018)**
2. **IEEE-CS Code of Ethics (2020)**

## Matriks Etika

| No | Sumber | Prinsip | Risiko pada UniKantin | Kontrol | Req ID |
|---|---|---|---|---|---|
| 1 | ACM 1.6 — Respect privacy | Data transaksi dan riwayat pesanan mahasiswa dapat diakses oleh pihak yang tidak berwenang (penjual tenant lain, pengguna lain) | Firestore Security Rules membatasi akses berdasarkan role; data pesanan hanya bisa diakses pemilik pesanan dan penjual terkait | PRV-03 |
| 2 | ACM 1.3 — Be honest and trustworthy | Informasi menu (harga, ketersediaan) ditampilkan tidak akurat sehingga mahasiswa memesan menu yang sudah habis atau harganya berbeda | Penjual wajib memperbarui status ketersediaan; harga ditampilkan dari sumber data yang sama dengan yang digunakan saat pemesanan | UX-01 |
| 3 | ACM 2.9 — Design and implement systems that are robust and usable | Status pembayaran ditampilkan secara menyesatkan (misal: ditandai lunas padahal belum) sehingga merugikan mahasiswa atau penjual | Status pembayaran hanya diubah oleh sistem pembayaran terkait; UI menampilkan status apa adanya; validasi di sisi server (rencana) | UX-02 |
| 4 | IEEE-CS 3 — Product (ensure adequate standards) | Penjual dapat melihat data pesanan dan transaksi di luar tenant miliknya sehingga terjadi kebocoran informasi antar-tenant | Otorisasi berbasis tenant ID; setiap query difilter berdasarkan tenant penjual; Firestore rules memvalidasi kesesuaian tenant | SEC-02 |
| 5 | IEEE-CS 6 — Profession (advance integrity and reputation) | Pengguna tidak memahami data apa yang dikumpulkan dan bagaimana data tersebut digunakan | Menyediakan kebijakan privasi yang mudah dipahami (R6); pengguna dapat mengakses hak-hak data pribadinya (R3) | PRV-01 |

## Catatan

- Prinsip-prinsip di atas dipilih berdasarkan relevansi langsung dengan risiko yang mungkin terjadi pada UniKantin.
- Kontrol yang disebutkan sebagian besar masih berupa **rencana implementasi** untuk milestone berikutnya.
- Referensi lengkap:
  - ACM Code of Ethics: https://www.acm.org/code-of-ethics
  - IEEE-CS Code of Ethics: https://www.computer.org/education/code-of-ethics
